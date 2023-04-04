# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-bashfunctions
pkgver=5.0.3
pkgrel=1
epoch=1
pkgdesc="A collection of shell functions"
arch=('any')
url="https://github.com/mulle-nat/mulle-bashfunctions"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-nat/mulle-bashfunctions/archive/5.0.3.tar.gz" "package.patch")
noextract=()
md5sums=('e1a8f6fbe947b4a2af966bb07fc2e5fa' '317ab45061adf8699fca047fabd90db3')
validpgpkeys=()

package() {
    # Install License
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Run Install
    chmod +x bin/installer
    bin/installer "${pkgdir}/usr"

    # Move libexec to lib/$pkgname
    cd "${pkgdir}/usr"
    if [ -d "libexec" ]; then
        mkdir -p "lib/"
        mv libexec/* "lib/"
        rm -r libexec
    fi
}

prepare() {
    patch --forward --strip=1 --input=package.patch
}
