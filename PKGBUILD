# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=i18nspector
pkgver=0.25.9
pkgrel=1
epoch=
pkgdesc="Checking tool for gettext POT, PO and MO files"
arch=('any')
url="http://jwilk.net/software/i18nspector"
license=('MIT')
groups=()
depends=('python' 'python-polib' 'python-rply-git')
makedepends=('python-docutils')
checkdepends=('python-nose')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jwilk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
noextract=()
sha256sums=('2ef35c8592c6e8e5a16c0aa2f6c15ab929756a374dc71707ae4479ee3cf0f9ec'
            'SKIP')
validpgpkeys=(CDB5A1243ACDB63009AD07212D4EB3A6015475F5) # Jakub Wilk

build() {
    cd "${srcdir}"/$pkgname-$pkgver
    make PREFIX=/usr
    make -C doc
}

check() {
    cd "${srcdir}"/$pkgname-$pkgver
    make test
}

package() {
    cd "${srcdir}"/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 doc/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
