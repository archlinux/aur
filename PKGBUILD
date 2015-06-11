# Maintainer: libernux <dutchman55@gmx.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=flamerobin-git
pkgver=0.9.2.r498.g0afb018
pkgrel=1
pkgdesc='A tool to handle Firebird database management'
arch=('i686' 'x86_64')
url="http://www.flamerobin.org/"
license=('expat')
depends=('wxgtk' 'libfbclient' 'boost')
makedepends=('git')
provides=('flamerobin')
conflicts=('flamerobin')
source=("$pkgname"::'git://git.code.sf.net/p/flamerobin/flamerobin-git.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config

  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}
