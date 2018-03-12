#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-rcp-source
pkgver=4.7.2
_buildTime=201711300510
pkgrel=1
pkgdesc='RCP sources for Eclipse IDE'
arch=('any')
url='http://eclipse.org/platform/'
license=('EPL')
depends=('eclipse>=4.3.0')
options=('!strip')
source=(
	"https://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.rcp.source-${pkgver}.zip"
)
sha256sums=('d7f8aae6546cc8e546120a475c336458c2753990da208b843c8bc1b01db69328')

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
