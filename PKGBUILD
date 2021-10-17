#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-rcp-source
pkgver=4.21
_buildTime=202109060500
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
sha256sums=('cc5a35a6ce818b5aee182ab5915955b51604e8214a42cba2258f434a837271fe')

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
