# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Maato <maato softwarebakery com>

# TODO: Consider adding an install-time message about
#       removing ~/.config/volumeicon/volumeicon if there are
#       problems running volumeicon. Ref FS#34239

pkgname=volumeicon-gtk2
_pkgname=volumeicon
pkgver=0.5.1
pkgrel=1
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
sha256sums=('24b8c1d0a81d708b201ce6e67301fc175d65588d892d01859f667b8db8a05da0'
            '68a0d28096e40ec734a0dd27d7bbfba45e26024a609a06aa52b5c6c5f1c665b8')

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
  make V=0
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
