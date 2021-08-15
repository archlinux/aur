# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20210525
pkgrel=2
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1f20535e4e3b5175ceea803a45b7286a99cab248829c39d11bc85780bc63e0e26c49ad78997a13e290fb4ad2c292d15eeb494a975d53fbe25dec80499e675b16')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md \
                 "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYING \
                 "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
