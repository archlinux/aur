# Maintainer: cars10t <carsten.1 gmx.de>

pkgname=eclipse-metrics
pkgver=1.3.6
pkgrel=1
pkgdesc="metrics calculation and dependency analyzer plugin for eclipse"
url="http://metrics.sourceforge.net/"
arch=('any')
license=('CPL')
depends=('eclipse')
source=("http://sourceforge.net/projects/metrics/files/Eclipse%20metrics%20plugin/${pkgver}%20for%20Eclipse%203.1/updatesite_${pkgver}.zip")
md5sums=('73afee4feda4198a3396168f7f65766d')

# no build() needed
package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}-${pkgver}/eclipse

  cd ${srcdir}/net.sourceforge.metrics.updatesite

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/net.sourceforge.metrics.updatesite/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
