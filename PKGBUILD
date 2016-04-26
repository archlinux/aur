# Contributor: Brad Pitcher <bradpitcher@gmail.com>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=networkmanager-l2tp
_pkgname=network-manager-l2tp
pkgver=1.2.0
pkgrel=1
pkgdesc="L2TP support for NetworkManager"
arch=('i686' 'x86_64')
url="https://github.com/nm-l2tp/NetworkManager-l2tp"
license=('GPL2')
depends=('gtk2' 'gconf' 'libgnome-keyring' 'intltool' 'networkmanager>=1.1.0'
'libnm-glib>=1.1.0' 'ppp>=2.4.7')
optdepends=('openswan')
options=()
makedepends=()
provides=('networkmanager-l2tp')
source=(https://github.com/nm-l2tp/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('5c78d5a3b04102d8a8b9d3fdda5f9da2')

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
