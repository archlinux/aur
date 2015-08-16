# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Marco Süß <m_a_r_c_o.suess at gmx.de>

_name=lash
pkgname=lib32-$_name
pkgver=0.6.0~rc2
_relver=0.6.0.594
pkgrel=2
pkgdesc="A session management system for JACK and ALSA. Multilib."
arch=('x86_64')
options=('!libtool')
url="http://lash.nongnu.org"
license=('GPL')
depends=('lash' 'lib32-dbus-core' 'lib32-util-linux' 'lib32-jack' 'jackdbus')
makedepends=('gcc-multilib' 'libtool-multilib')
source=("http://download.savannah.gnu.org/releases/lash/$_name-$pkgver.tar.bz2")
md5sums=('af1dc4f4ceb284b1b0845de4f4c2fe47')

build() {
  cd "$srcdir/$_name-$_relver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-static=no \
              --without-python
  cd liblash && make
}

package() {
  cd "$srcdir/$_name-$_relver/liblash"
  make DESTDIR="$pkgdir/" install
}
