# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=i18nspector
pkgver=0.26
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
sha256sums=('86dbaedbb8c2e3e834b308025cb5161e3ba0a8fcd575ac0a4f778e0f92e59d6f'
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
