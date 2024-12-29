# Submitter  Novikov Maxim <the.mlex@gmail.com>
# Maintainer  Klaus Zipfel <zipfel@iqo.uni-hannover.de>
pkgname=fusioninventory-agent-bin
_pkgname="FusionInventory-Agent"
pkgver=2.6
pkgrel=1
pkgdesc="An application for keeping track of the hardware and software"
arch=(any)
url="https://github.com/fusioninventory/fusioninventory-agent"
license=('GPL')
provides=('fusioninventory-agent')
conflicts=('fusioninventory-agent')
install=.INSTALL
depends=(
  'perl>=5.8'
  'perl-module-build'
  'perl-file-which'
  # Provides LWP::UserAgent
  'perl-libwww>=5.8'
  'perl-net-ip'
  'perl-text-template'
  #'perl-universal-require'
  #'perl-xml-treepp>=0.26'
  'perl-data-structure-util'
  #'perl-proc-daemon'
  # Used to fetch missing perl dependencies
  'cpanminus'
)
source=("https://github.com/fusioninventory/fusioninventory-agent/releases/download/${pkgver}/fusioninventory-agent_${pkgver}-${pkgrel}_all.deb")
md5sums=('6a7599a355f03192cf16ef852bc93944')


package() {
  tar xf ${srcdir}/data.tar.xz
    
  # Clear
  unlink ${srcdir}/control.tar.xz
  unlink ${srcdir}/data.tar.xz
  unlink ${srcdir}/debian-binary
  unlink ${srcdir}/fusioninventory-agent_${pkgver}-${pkgrel}_all.deb
  
  cp -a ${srcdir}/etc/ $pkgdir/etc/
  cp -a ${srcdir}/usr/ $pkgdir/usr/
  cp -a ${srcdir}/lib/ $pkgdir/usr/lib/
  cp -a ${srcdir}/var/ $pkgdir/var/
  
  install -D -m444 ${srcdir}/usr/share/fusioninventory/etc/agent.cfg $pkgdir/etc/fusioninventory/agent.cfg.default
}
