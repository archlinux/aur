# Maintainer: Jef Roosens
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=vlang
pkgname=vlang-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software (binary release)'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
conflicts=('v' 'vlang' 'vlang-git')
provides=('vlang')
depends=('glibc')
optdepends=('glfw: Needed for graphics support'
            'freetype2: Needed for graphics support'
            'openssl: Needed for http support')
source=("${_pkgname}-${pkgver}.zip::https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
sha256sums=('62ca4428d448abd219e5ec72e12a786afd0ed3f7d0a5b4795de9935d746d32f4')
sha512sums=('b64a63abeab14277fdd8ea719bf92c228d07ea4a53388b1492b2ec1462cbac849453f78229ba7d4dcd9160dc2f3fa32c99cc9e5aa85840576fee49f93c89f6f0')

build() {
    cd v

    # Binaries for the tools are not provided with the "binary" release, so we
    # still have to build these.
    LDFLAGS= ./v build-tools
}

package() {
    cd v

    install -d "${pkgdir}/usr/lib/vlang" "${pkgdir}/usr/share/vlang" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 v "${pkgdir}/usr/lib/vlang"
    cp -a cmd "${pkgdir}/usr/lib/vlang/"
    cp -a examples "${pkgdir}/usr/share/vlang/"
    cp -a thirdparty "${pkgdir}/usr/lib/vlang/"
    cp -a vlib "${pkgdir}/usr/lib/vlang/"
    cp v.mod "${pkgdir}/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

    touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}

# vim: ft=bash
