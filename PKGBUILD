# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>

pkgname=eclipse-emf-runtime
pkgver=2.11.1
_pkgbuild=R201508060404
pkgrel=1
pkgdesc="EMF and XSD runtime only for the Eclipse platform"
url="http://www.eclipse.org/modeling/emf/"
arch=('any')
license=('EPL')
depends=('eclipse')
makedepends=('unzip')
conflicts=('eclipse-emf')
provides=('eclipse-emf')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/modeling/emf/emf/downloads/drops/${pkgver}/${_pkgbuild}/emf-runtime-${pkgver}.zip"
        "$_mirror/modeling/emf/emf/downloads/drops/${pkgver}/${_pkgbuild}/xsd-runtime-${pkgver}.zip")
md5sums=('7f106f3489bfdab51067e3a7fa17cc7c'
         '64d4d0baa850c623d0fc23b77675b9ef')

package() {
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
