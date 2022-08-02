# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=vo-aacenc
pkgver=0.1.3
pkgrel=1
epoch=1
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=("https://sourceforge.net/projects/opencore-amr/files/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -vfi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {ChangeLog,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
