#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-rcp-source
pkgver=4.8
_buildTime=201806110500
pkgrel=1
pkgdesc='RCP sources for Eclipse IDE'
arch=('any')
url='http://eclipse.org/platform/'
license=('EPL')
depends=('eclipse>=4.3.0')
options=('!strip')
source=(
	"https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.rcp.source-${pkgver}.zip&r=1"
)
sha256sums=('a7238fc9971484b7ed321f86f30e3358e373ae39260770c9469c754bef0e3ee4')

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
