# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=networkmanager-sstp
_pkgname=NetworkManager-sstp
pkgver=0.9.10
pkgrel=1
pkgdesc="SSTP support for NetworkManager"
arch=('i686' 'x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('sstp-client-svn-stable' 'nm-connection-editor' 'libsecret')
optdepends=('ppp>=2.4.7')
options=()
makedepends=()
provides=('networkmanager-sstp')
source=(http://sourceforge.net/projects/sstp-client/files/network-manager-sstp/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
