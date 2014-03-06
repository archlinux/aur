# Maintainer: Roman Scherer <roman@burningswell.com>

pkgname=immutant
pkgver=1135
pkgrel=1
pkgdesc='Application server for Clojure'
arch=('any')
url='http://immutant.org'
license=('LGPL')
depends=('java-environment')
makedepends=('java-environment>=6')
_pkgloc=usr/share

backup=(etc/profile.d/${pkgname}.sh
        ${_pkgloc}/immutant/jboss/standalone/configuration/logging.properties
        ${_pkgloc}/immutant/jboss/standalone/configuration/mgmt-users.properties
        ${_pkgloc}/immutant/jboss/standalone/configuration/standalone-full-ha.xml
        ${_pkgloc}/immutant/jboss/standalone/configuration/standalone-full.xml
        ${_pkgloc}/immutant/jboss/standalone/configuration/standalone-ha.xml
        ${_pkgloc}/immutant/jboss/standalone/configuration/standalone.xml
        ${_pkgloc}/immutant/jboss/bin/standalone.conf
        ${_pkgloc}/immutant/jboss/bin/domain.conf)

install=${pkgname}.install

source=(http://immutant.org/builds/${pkgver}/immutant-dist-slim.zip
	immutant.wrapper
        immutant.install
        immutant.profile
        immutant.service)

package() {
  cd "${srcdir}/immutant-1.x.incremental.${pkgver}-slim"
  install -dm755 ${pkgdir}/${_pkgloc}
  cp -R ${srcdir}//immutant-1.x.incremental.${pkgver}-slim ${pkgdir}/${_pkgloc}/${pkgname}
  install -Dm755 ${srcdir}/immutant.profile ${pkgdir}/etc/profile.d/immutant.sh
  install -Dm755 ${srcdir}/immutant.service ${pkgdir}/usr/lib/systemd/system/immutant.service
  install -Dm755 ${srcdir}/immutant.wrapper ${pkgdir}/${_pkgloc}/immutant/jboss/bin/immutant
  chmod 775 ${pkgdir}/${_pkgloc}/immutant/jboss/standalone/deployments
}

md5sums=('dada8d0a495c925336e01db7f4829f11'
         '9a7380fd66643c65d2a978bc03a7d076'
         'efa9fdc79a263371180c5209fe24a07a'
         '59acab08bffa79f5a41cba46246ee4ea'
         'bf168d26ffcd4d98390fd5d76e2dd0f0')
