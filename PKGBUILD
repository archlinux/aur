#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-rcp-source
pkgver=4.6.2
_buildTime=201611241400
pkgrel=1
pkgdesc='RCP sources for Eclipse IDE'
arch=('any')
url='http://eclipse.org/platform/'
license=('EPL')
depends=('eclipse>=4.3.0')
options=('!strip')
source=(
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.rcp.source-${pkgver}.zip"
)
sha256sums=('d8603543b65ab6ef82a7a8da0e6e3fad968b9c10dd0458ed8dd4d4c0fa9ecfa2')

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
