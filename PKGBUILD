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
optdepends=('ppp>=2.4.6')
options=()
makedepends=('intltool' 'ppp>=2.4.6' 'gawk')
provides=('networkmanager-sstp')
source=(http://sourceforge.net/projects/sstp-client/files/network-manager-sstp/${pkgver}-${pkgrel}/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('7bdfd7f526ef7a4f50b450bca02ecc4b52aff5663633e8ad953ecb8eaedfe9d2d26a8ae3cb7b286150313c10c6fac4d8e2481c9fa09381ccd6c6c515989a9585')

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/networkmanager \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --libdir=/usr/lib \
    --enable-more-warnings=yes

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
