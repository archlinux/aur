# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Alexander Bachler Jansson <alexander.bachler.jansson@gmail.com> 
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Simon Morgan <simon@16hz.net>

pkgname=nosefart
pkgver=2.9
pkgrel=2
pkgdesc='NES sound format player'
arch=('x86_64' 'i686')
url='http://nosefart.sourceforge.net/'
makedepends=('libpulse')
license=('GPL')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver}-mls.tar.bz2"
        'nosefart-2.9-pulseaudio-mls.patch')
sha256sums=('43fa05190cc6a62f30662dcb65768413a77a73962961e520ccd9245cd3e35a39'
            '67518573195c11b0826b2c6a3243a136fb128902bdabf13e77687d917ba9f97d')

prepare() {
  cd "$pkgname-$pkgver-mls"

  patch -p1 -i ../nosefart-2.9-pulseaudio-mls.patch
}

build() {
  cd "$pkgname-$pkgver-mls"

  make WANT_DEBUG=FALSE
}

package() {
  cd "$pkgname-$pkgver-mls"

  make PREFIX="$pkgdir/usr" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
