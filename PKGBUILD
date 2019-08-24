# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20190805
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('desktop-file-utils' 'libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.source.tar.gz::https://github.com/schismtracker/schismtracker/releases/download/$pkgver/$pkgname-$pkgver.source.tar.gz")
sha512sums=('89c5060e96f3cb60aa0a260cf4c71e8e30d77213a675f006bc98abc38f9227ebfb451d030e805b897f7240c897a38a23e4c912bbb95cfde989e26836063da60e')

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
