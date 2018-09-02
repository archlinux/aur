# Maintainer: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3-git
_gitname=gcolor3
pkgver=2018.09.01
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3. Git version."
arch=('i686' 'x86_64')
url="http://hjdskes.nl/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'gnome-common')
conflicts=('gcolor3')
source=('git://github.com/Hjdskes/gcolor3.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
    cd $_gitname/
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd $_gitname/
    DESTDIR="$pkgdir" ninja -C build install
}

