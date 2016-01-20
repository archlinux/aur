# Maintainer: Mark Old <dlom234@gmail.com>

_gitname=highcommand
pkgname=$_gitname-git
pkgver=r53.0e8424d
pkgrel=1
pkgdesc="getopt() for the future"
url="https://github.com/dlom/highcommand"
license=("MIT")
depends=("glibc")
makedepends=("ruby-ronn")
checkdepends=("cmocka")
arch=("i686" "x86_64")
provides=("highcommand")
conflicts=("highcommand")
source=("git+https://github.com/dlom/$_gitname.git")
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$_gitname"
    make check
}
