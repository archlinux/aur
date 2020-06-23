# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20200412
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.source.tar.gz::https://github.com/schismtracker/schismtracker/releases/download/$pkgver/$pkgname-$pkgver.source.tar.gz")
sha512sums=('0a1d857a772ab41c779ebb22b1f885654998cb4126cad2aaf35caf60a4275fca1163b4e35a770502fa4d7a07fc57cb77d539c5d54bd922646a53b4866e84a1c3')

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
