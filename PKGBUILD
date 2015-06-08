#Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-ptp
pkgver=8.1.1
_pkgdate=201502031415
pkgrel=1
pkgdesc="Parallel developer tools for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/ptp/"
license=('EPL')
depends=('eclipse')

_mirror="http://www.eclipse.org/downloads/download.php?r=1&mirror_id=1&file="
source=("$_mirror/tools/ptp/updates/$pkgver/ptp-master-${pkgver}.${_pkgdate}.zip")

md5sums=('cec1500a192df7cf1ebbd04a5752afaf')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

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
