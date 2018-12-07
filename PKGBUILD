# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: zierf
# Contributor: Rastislav Barlik <barlik.arch at gmx dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Tom Vincent <http://www.tlvince.com/contact/>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=jack_mixer
pkgver=10
pkgrel=2
pkgdesc="A GTK based Jack audio mixer"
url="http://home.gna.org/jackmixer/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'python2-fpconst' 'pygtk' 'jack' 'hicolor-icon-theme')
optdepends=('lash: session support'
            'python2-gconf: gconf support')
options=('!libtool')
install="$pkgname.install"
source=("http://http.debian.net/debian/pool/main/j/jack-mixer/jack-mixer_${pkgver}.orig.tar.gz")
md5sums=('d45cf4665689cc83ccee8b25a41faf91')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #Python2 fixes
  export PYTHON="python2"
  sed -i "s_env python_&2_" $pkgname.py

  ./configure \
	--prefix=/usr \
	--sysconfdir=/usr/share \
	--disable-schemas-install

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
