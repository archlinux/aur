# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20190722
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('desktop-file-utils' 'libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.source.tar.gz::https://github.com/schismtracker/schismtracker/releases/download/$pkgver/$pkgname-$pkgver.source.tar.gz")
sha512sums=('2c7532dc13e894292df66246ff6690f3f845472a0ac460cfbc831a2844bea97deb57fd396ba35ef97ce76cc9416852069a6580115a5a3ee76ca5953052163797')

prepare () {
  # Correcting the file "schism.desktop"
  cd $srcdir/$pkgname/sys/fd.org
  sed -i 's/Audio;/AudioVideo;Audio;/' schism.desktop
}

build() {
  cd $srcdir/$pkgname
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md \
                 "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYING \
                 "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
