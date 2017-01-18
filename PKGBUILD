# Contributor: Brad Pitcher <bradpitcher@gmail.com>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=networkmanager-l2tp
_pkgname=network-manager-l2tp
pkgver=1.2.4
pkgrel=3
pkgdesc="L2TP support for NetworkManager"
arch=('i686' 'x86_64')
url="https://github.com/nm-l2tp/NetworkManager-l2tp"
license=('GPL2')
depends=('gtk2' 'gconf' 'libgnome-keyring' 'intltool' 'networkmanager>=1.2.0'
'libnm-glib>=1.2.0' 'ppp>=2.4.7' 'xl2tpd')
optdepends=(
  'libreswan: IPSec support (recommended)',
  'strongswan: IPSec support',
  )
options=()
makedepends=()
provides=('networkmanager-l2tp')
source=(https://github.com/nm-l2tp/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('7928aa33fde92b66559360d7ee52cb82')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/networkmanager \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.7 \
    --enable-more-warnings=yes

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
