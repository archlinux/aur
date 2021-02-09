# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=qalculate-gtk-git
_pkgname="${pkgname%-git}"
pkgver=r387.ac03bc3
pkgrel=1
pkgdesc="GTK frontend for libqalculate"
arch=('x86_64')
url="https://qalculate.github.io/"
license=('GPL')
depends=('libqalculate' 'gtk3')
makedepends=('intltool' 'rarian' 'git')
optdepends=('yelp: for displaying the help')
conflicts=('qalculate-gtk')
provides=('qalculate-gtk')
source=('git+https://github.com/Qalculate/qalculate-gtk.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    ./autogen.sh
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
