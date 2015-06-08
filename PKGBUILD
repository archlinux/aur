# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-eclemma
pkgver=2.3.2
pkgrel=1
pkgdesc="A free Java code coverage tool for Eclipse"
url="http://www.eclemma.org/"
arch=('any')
license=('EPL')
depends=('eclipse')
source=("http://download.eclipselab.org/eclemma/release/${pkgname/eclipse-}-${pkgver}.zip")
sha256sums=('5e3c04fdfe1d9d4d6423fb1860c924dc68d2d9c497a67ac123160470b2fc1cd9')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}-${pkgver}/eclipse

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
