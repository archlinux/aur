# Maintainer: unknowndev <unknowndevQwQ@protonmail.com>

pkgname=fp-multiuser
pkgver=0.0.2
pkgrel=1
pkgdesc="A frp server plugin to support multiple users for frp"
arch=('x86_64')
url="https://github.com/gofrp/fp-multiuser"
license=('Apache')
depends=('glibc')
optdepends=('frps: provide frp server')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7eb5556134aaec3246d5849af76408195a8037e5ca382fedeaf19a94e049a45e560d396ae63cfb9e96b9088a6f83bb7c34d0214233013e41a0fd378f04cfae29')



build() {
    cd "${pkgname}-${pkgver}"

#        export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
        export GOFLAGS="-buildmode=pie -trimpath -modcacherw" # -mod=readonly Lead to build failure
        export CGO_ENABLED=0 # build full static binary
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        make
}

package() {
    cd "${pkgname}-${pkgver}"
#    sed -i '7 s/#Type=exec/Type=exec/'                "fp-multiuser.service"
#    sed -i '8 s/Type=simple/#Type=simple/'            "fp-multiuser.service"
#    install -Dm644 "fp-multiuser.service" -t          "$pkgdir/usr/lib/systemd/system"
#    install -Dm644 "fp-multiuser@.service" -t         "$pkgdir/usr/lib/systemd/system"

    install -Dm755 "LICENSE" -t                        "${pkgdir}/usr/share/licenses/fp-multiuser"    
    install -Dm755 "bin/fp-multiuser" -t               "${pkgdir}/usr/bin"    
}
