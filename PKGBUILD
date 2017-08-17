# Maintainer : Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Previous Maintainer : kuri <sysegv at gmail dot com>
# Contributor : Kevin C <kiven at kiven dot fr>
# Contributor: Alex 'AdUser' Z
pkgname=fusioninventory-agent-bin
_pkgname="FusionInventory-Agent"
pkgver=2.3.21
pkgrel=2
pkgdesc="An application for keeping track of the hardware and software"
arch=(any)
url="http://fusioninventory.org"
_watch="http://debian.fusioninventory.org/downloads"
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
)
source=("http://debian.fusioninventory.org/downloads/fusioninventory-agent_${pkgver}-2_all.deb"
  "agent.cfg"
)
md5sums=('6ede95612470907f1964fa9f00732c4f'
  'eaf2c13c8adb7e57da038f3ae521ab35'
)


package() {
  tar xf ${srcdir}/data.tar.xz
    
  # Clear
  unlink ${srcdir}/control.tar.gz
  unlink ${srcdir}/data.tar.xz
  unlink ${srcdir}/debian-binary
  unlink ${srcdir}/fusioninventory-agent_${pkgver}-2_all.deb
  
  cp -a ${srcdir}/etc/ $pkgdir/etc/
  cp -a ${srcdir}/usr/ $pkgdir/usr/
  cp -a ${srcdir}/lib/ $pkgdir/usr/lib/
  cp -a ${srcdir}/var/ $pkgdir/var/
  
  install -D -m444 ${srcdir}/agent.cfg $pkgdir/etc/fusioninventory/agent.cfg.default
}
