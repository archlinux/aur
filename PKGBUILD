# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>

pkgname=eclipse-emf-runtime
pkgver=2.8.0
_pkgbuild=R201206080554
pkgrel=1
pkgdesc="EMF and XSD runtime only for the Eclipse platform"
url="http://www.eclipse.org/modeling/emf/"
arch=('any')
license=('EPL')
depends=('eclipse')
makedepends=('unzip')
conflicts=('eclipse-emf')
provides=('eclipse-emf')
changelog=$pkgname.changelog
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/modeling/emf/emf/downloads/drops/${pkgver}/${_pkgbuild}/emf-runtime-${pkgver}.zip"
        "$_mirror/modeling/emf/emf/downloads/drops/${pkgver}/${_pkgbuild}/xsd-runtime-${pkgver}.zip")
md5sums=('60c46c38650755f6b2f171e73f495df0'
         'e99916d6a1b74c916487f65e3c3afcc8')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}/eclipse

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
