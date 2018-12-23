# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20180810
pkgrel=1
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('desktop-file-utils' 'libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgver.tar.gz::https://github.com/schismtracker/schismtracker/archive/$pkgver.tar.gz")
sha512sums=('d131cec7e4749941f0e5806bff14e0782a01f14f8a68605270d09ff40af1d20fffd4c7caf2926c5a63d3e0c0bb1ed24ce4a5e4cccc280ac045a22cfb8544c498')

prepare () {
  # Correcting the file "schism.desktop"
  cd $srcdir/$pkgname-$pkgver/sys/fd.org
  sed -i 's/Audio;/AudioVideo;Audio;/' schism.desktop
}

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md \
                 "$pkgdir/usr/share/doc/schismtracker/README.md"
  install -Dm644 COPYING \
                 "$pkgdir/usr/share/licenses/schismtracker/COPYING"
}
