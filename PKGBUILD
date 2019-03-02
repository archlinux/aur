# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20181223
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('desktop-file-utils' 'libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.source.tar.gz::https://github.com/schismtracker/schismtracker/releases/download/$pkgver/$pkgname-$pkgver.source.tar.gz")
sha512sums=('d2ba655e127376b33be9b6b674bfd6dc3413b89b01915aec7c514a25edc462fefcf9976c916ae3c2ea492b4c4f6ebdb236ff405a18470a6533b0add94944085f')

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
