# Contributor: Thom Wiggers <pkgbuild@thomwiggers.nl>
# Contributor: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

pkgname=networkmanager-iodine-git
pkgver=r170.d0e5d85
pkgrel=2
pkgdesc="Iodine plugin for NetworkManager - git version"
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/GNOME/network-manager-iodine'
license=('GPL')
depends=(
  'at-spi2-core'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'iodine'
  'libnm'
  'libnma'
  'libsecret'
  'networkmanager'
  'pango'
  'zlib'
)
makedepends=('git' 'intltool')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/$pkgname"
  autoreconf --install --force --verbose
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname
}

build() {
  cd "${srcdir}/$pkgname"
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}
