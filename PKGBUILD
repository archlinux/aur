# Maintainer: tunalad <tunalad@proton.me>
pkgname=nsp-git
pkgver=r9.6a69f7f
pkgrel=1
pkgdesc="New Serbian Translation Bible on the Command Line"
arch=('any')
url="https://github.com/tunalad/nsp"
license=('The Unlicense')
depends=('bash' 'coreutils' 'gawk' 'sed' 'ncurses' 'tar')
optdepends=('less: for better preview')
provides=('nsp')
makedepends=('git')
source=('nsp::git+https://github.com/tunalad/nsp.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "nsp" "$pkgdir/usr/bin/nsp"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
