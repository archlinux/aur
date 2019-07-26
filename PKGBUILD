# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=libqmi-git
pkgver=1.23.1+68+ga48f7ee
pkgrel=1
pkgdesc="QMI modem protocol helper library"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/libqmi/"
license=(GPL2)
provides=(libqmi)
conflicts=(libqmi)
depends=(libmbim libgudev)
makedepends=(gtk-doc python git help2man)
source=("git+https://gitlab.freedesktop.org/mobile-broadband/libqmi.git")
sha256sums=('SKIP')

pkgver() {
  cd libqmi
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libqmi
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libqmi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --disable-gtk-doc
  make
}

check() {
  cd libqmi
  make check
}

package() {
  cd libqmi
  make DESTDIR="$pkgdir" install
}
