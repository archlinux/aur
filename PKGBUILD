# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-bashfunctions
pkgver=3.4.0
pkgrel=1
epoch=1
pkgdesc="A versioned collection of bash functions"
arch=('any')
url="https://github.com/mulle-nat/mulle-bashfunctions"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-nat/mulle-bashfunctions/archive/3.4.0.tar.gz" "package.patch")
noextract=()
md5sums=('fa6c1feb32d0cc2c83b4926788d30b18' '732d4569ee354923f89e4dc30af50f0c')
validpgpkeys=()

package() {
    # Install License
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Run Install
    cd bin
    chmod +x installer
    ./installer "${pkgdir}/usr"

    # Move libexec to lib/$pkgname
    cd "${pkgdir}/usr"
    mkdir -p "lib/"
    mv libexec/* "lib/"
    rm -r libexec
}

prepare() {
    patch --forward --strip=1 --input=package.patch
}
