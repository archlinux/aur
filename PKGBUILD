# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-emft-mwe
pkgver=2.11.0
_buildtime=R201906111547
pkgrel=3
pkgdesc="Model Workflow Engine plug-in for Eclipse IDE"
arch=('any')
url="https://www.eclipse.org/modeling/emft/"
license=('EPL')
depends=('eclipse-emf' 'eclipse-orbit-com-google-inject')
options=('!strip')
# http://www.eclipse.org/modeling/download.php?file=/modeling/emft/mwe/downloads/drops/2.11.0/R201906111547/emft-mwe-2-lang-Update-2.11.0.zip
source=(
	http://download.eclipse.org/modeling/emft/mwe/downloads/drops/${pkgver}/${_buildtime}/emft-mwe-2-lang-Update-${pkgver}.zip
)
sha256sums=('6c423d693ab8c4fd152238d001e2192dbda6142096377ed49009403c371149e0')

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  cd ${srcdir}

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
