pkgname=eclipse-jvmmonitor
pkgver=3.8.1_beta
pkgrel=1
pkgdesc="Java profiler integrated with Eclipse"
arch=('any')
url="http://www.jvmmonitor.org/"
license=('EPL')
depends=('eclipse')
source=(http://jvmmonitor.eclipselabs.org.codespot.com/files/org.jvmmonitor_${pkgver}.zip)
md5sums=('d7533f1e2b509d172070e56145ce5b94')

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
