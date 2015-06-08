# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-cvs
pkgver=3.7.2
pkgrel=1
pkgdate=201202080800
pkgdesc="CVS Integration - Separated from Eclipse SDK package. Use with eclipse-platform"
url="http://www.eclipse.org/eclipse/platform-cvs/"
arch=('any')
license=('EPL')
depends=('eclipse-platform')
makedepends=('unzip')
options=(!strip)
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/eclipse/downloads/drops/R-${pkgver}-${pkgdate}/org.eclipse.cvs-${pkgver}.zip")
md5sums=('f14cb419dc444411db5d309fe3b28433')

build() {
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
