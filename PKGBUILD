# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=l2tp-ipsec-vpn
pkgver=1.0.9
pkgrel=3
pkgdesc="A GUI to manage L2TP over IPsec virtual private network connections."
arch=('i686' 'x86_64')
url="https://launchpad.net/l2tp-ipsec-vpn"
license=('GPL')
depends=('openswan' 'xl2tpd' 'qt4' 'l2tp-ipsec-vpn-daemon')
makedepends=('ctemplate')
optdepends=()
source=(https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz
        0001-Qt4.patch)
md5sums=('4679e6fae4e82f285ee39479660ba48f'
         'df38c669559503a8abb287e081144688')

prepare() {
	cd "$srcdir/$pkgname"
  patch -p1 < $srcdir/0001-Qt4.patch
}

build() {
	cd "$srcdir/$pkgname"
  make
}

package() {
	cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir/" -f nbproject/qt-Release.mk install
}
