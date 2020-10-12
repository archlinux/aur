# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3-git
_gitname=gcolor3
pkgver=2.4.0.r13.gf6f8482
pkgrel=1
epoch=1
pkgdesc="A simple color selection dialog in GTK3. Git version."
arch=('i686' 'x86_64')
url="http://hjdskes.nl/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libportal')
makedepends=('git' 'meson' 'gnome-common')
conflicts=('gcolor3')
source=('git+https://gitlab.gnome.org/World/gcolor3.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
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

