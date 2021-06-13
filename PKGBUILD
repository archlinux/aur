# Maintainer: Leonardo Eugênio <lelgenio@disroot.org>
pkgname=lipsum-git
pkgver=r39.61f4f25
pkgrel=1
pkgdesc="CLI lorem ipsum generator"
arch=('x86_64')
url="https://github.com/hannenz/lipsum"
license=('GPL')
depends=()
makedepends=('git' 'vala' 'gtk3' 'plank' 'gettext')
optdepends=(
    'gtk3: Graphical User Interface'
    'plank: Plank applet'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make all
}

package() {
    cd "$srcdir/${pkgname%-git}"

    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
