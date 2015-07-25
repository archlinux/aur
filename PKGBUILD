#Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-ptp
pkgver=9.0.0
_pkgdate=201506101404
pkgrel=1
pkgdesc="Parallel developer tools for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/ptp/"
license=('EPL')
depends=('eclipse')

_mirror="http://www.eclipse.org/downloads/download.php?r=1&mirror_id=1&file="
source=("$_mirror/tools/ptp/updates/$pkgver/ptp-master-${pkgver}.${_pkgdate}.zip")

md5sums=('900a97c435fb5ce5560ab09cb0838889')

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
