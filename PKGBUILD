# Contributor: Brad Pitcher <bradpitcher@gmail.com>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=networkmanager-l2tp
_pkgname=NetworkManager-l2tp
pkgver=0.9.8.7
pkgrel=1
pkgdesc="L2TP support for NetworkManager"
arch=('i686' 'x86_64')
url="https://github.com/seriyps/NetworkManager-l2tp"
license=('GPL2')
depends=('gtk2' 'gconf' 'libgnome-keyring' 'intltool' 'networkmanager' 'xl2tpd')
optdepends=('openswan' 'ppp>=2.4.6')
options=()
makedepends=()
provides=('networkmanager-l2tp')
source=(https://github.com/seriyps/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('5626971b69120583f59e1eace54f5371')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/networkmanager \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.6 \
    --enable-more-warnings=yes

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
