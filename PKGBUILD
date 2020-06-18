# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: zierf
# Contributor: Rastislav Barlik <barlik.arch at gmx dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Tom Vincent <http://www.tlvince.com/contact/>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=jack_mixer
pkgver=11
pkgrel=1
pkgdesc="A GTK based Jack audio mixer"
url="https://rdio.space/jackmixer/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libjack.so' 'python-gobject' 'hicolor-icon-theme')
optdepends=('lash: session support')
options=('!libtool')
install="$pkgname.install"
source=("https://rdio.space/jackmixer/tarballs/jack_mixer-${pkgver}.tar.gz")
md5sums=('169485489708721ecb25ffe33efa5d67')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
	--prefix=/usr \
	--sysconfdir=/usr/share \
	--disable-schemas-install

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 AUTHORS README NEWS -t "${pkgdir}/usr/share/doc/${pkgname}"
}
