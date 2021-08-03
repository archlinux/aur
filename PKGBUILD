# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='mdpdf'
pkgname="${_pkgname}-git"
pkgver=r6.3b399c7
pkgrel=1
pkgdesc='a shell script for converting markdown to pdf using lowdown. '
arch=(x86_64)
url='https://github.com/soystemd/mdpdf'
license=(GPL)
makedepends=(git)
depends=(lowdown)
optdepends=('zathura: for opening pdfs after markdown compilation')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
