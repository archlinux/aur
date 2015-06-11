# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Maato <maato softwarebakery com>

# TODO: Consider adding an install-time message about
#       removing ~/.config/volumeicon/volumeicon if there are
#       problems running volumeicon. Ref FS#34239

pkgname=volumeicon-gtk2
_pkgname=volumeicon
pkgver=0.5.0
pkgrel=3
pkgdesc='Volume control for your system tray (compiled for gtk2)'
arch=('x86_64' 'i686')
url='http://softwarebakery.com/maato/volumeicon.html'
license=('GPL3')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('gtk2' 'alsa-lib' 'libnotify')
makedepends=('intltool')
source=("http://softwarebakery.com/maato/files/volumeicon/$_pkgname-$pkgver.tar.gz"
        gtk2.patch)
sha256sums=('e5f1179f9ec5ab25e3740e4f6bbe0baa75368f0ae87d370197b3fbefb61bd782'
            'd9be16c6536008dd6e8d40a2b7ea9b82c3d6048698c948caddfc9a61ee1ace7e')

prepare() {
  cd "$_pkgname-$pkgver"

  patch -Np2 -b -z .orig -i ../gtk2.patch
  autoreconf -fi
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-notify
  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
