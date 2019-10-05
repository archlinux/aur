#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-rcp-source
pkgver=4.13
_buildTime=201909161045
pkgrel=1
pkgdesc='RCP sources for Eclipse IDE'
arch=('any')
url='http://eclipse.org/platform/'
license=('EPL')
depends=('eclipse>=4.3.0')
options=('!strip')
# 
source=(
	"https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.rcp.source-${pkgver}.zip&r=1"
)
sha256sums=('51eba88050b02cc126f94aeaaaf30e1cdc6224cf2bef0d7464d4e3d712766fe6')

package() {
  # remove binary and features folder
  rm -Rf binary features
  # remove files in plugins folder, which do not contain "source_", because we only need the sources
  find plugins -type f | grep -v source_ | xargs rm
  # copy plugins
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
