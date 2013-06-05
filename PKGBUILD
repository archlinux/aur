# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Alistair Dutton <kelveden at gmail.com>

pkgname=eclipse-checkstyle
pkgver=6.5.0
_pkgver_date=201504121610
pkgrel=1
pkgdesc="Checkstyle plugin for Eclipse"
arch=('any')
url="http://eclipse-cs.sourceforge.net/"
license=('LGPL')
depends=('eclipse')
optdepends=()
source=("http://sourceforge.net/projects/eclipse-cs/files/Eclipse%20Checkstyle%20Plug-in/${pkgver}/net.sf.eclipsecs-updatesite_${pkgver}.${_pkgver_date}-bin.zip")
sha256sums=('02abf1680bdac01a27cbb0cab9a72b9c6015baa41d0b683bbc4485d314a72f07')

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
