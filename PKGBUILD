# Maintainer: Jason Edson <jaysonedson@gmail.com>

_pkgname=meld
pkgname=$_pkgname-dev
pkgver=3.21.0
pkgrel=2
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('dconf'
         'gsettings-desktop-schemas'
         'gtksourceview4'
         'python-cairo'
         'python-gobject')
makedepends=('git'
             'intltool'
             'meson'
             'yelp-tools')
optdepends=('python-dbus: open a new tab in an already running instance')
provides=('meld')
conflicts=('meld' 'meld-git')
options=('!emptydirs')
source=("https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/meld-${pkgver}.tar.xz")
sha256sums=('b680114d5ab793324549fd58f4eb202d8e280c0633a0b765ede6dfb34160a81b')

prepare() {
  cd $_pkgname-$pkgver
}

build() {
  cd $_pkgname-$pkgver
    arch-meson build -D docs=true -D byte-compile=false
    ninja -C build
}

package() {
  cd $_pkgname-$pkgver
    DESTDIR="${pkgdir}" meson install -C build
}
