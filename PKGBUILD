# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=networkmanager-sstp
pkgver=1.2.6
pkgrel=1
pkgdesc="SSTP support for NetworkManager"
arch=('i686' 'x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('sstp-client' 'nm-connection-editor' 'libsecret')
optdepends=('ppp>=2.4.6')
options=()
makedepends=('git' 'intltool' 'ppp>=2.4.6' 'gawk' 'python')
provides=('networkmanager-sstp')
source=("https://github.com/enaess/network-manager-sstp/archive/release-${pkgver}.tar.gz")
sha1sums=('2e3654c5293a7513c5365553ca0df1f98b9820d8')

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/network-manager-sstp-release-${pkgver}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --enable-more-warnings=no

  make
}

package() {
  cd "${srcdir}/network-manager-sstp-release-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
