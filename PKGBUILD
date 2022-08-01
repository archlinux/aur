# Maintainer: Jonathan Boyle <programmerfalcon@gmail.com>
pkgname=mulle-bashfunctions
pkgver=4.1.1
pkgrel=1
epoch=1
pkgdesc="A collection of shell functions"
arch=('any')
url="https://github.com/mulle-nat/mulle-bashfunctions"
license=('BSD3')
groups=('mulle-sde-all')
depends=('bash')
changelog="RELEASENOTES.md"
source=("https://github.com/mulle-nat/mulle-bashfunctions/archive/4.1.1.tar.gz" "package.patch")
noextract=()
md5sums=('910b840579c70b831efb23d241879ddf' 'ae1135c609e963283f0840afd5d21f86')
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
