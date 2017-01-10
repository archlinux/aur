# Maintainer: David Rosenstrauch <darose@darose.net>
 
pkgname=eclipse-svnkit
pkgver=1.8.14
pkgrel=1
pkgdesc="The only pure Java Subversion library in the world"
arch=('any')
url="https://svnkit.com/index.html"
license=('TMate')
depends=('eclipse')
source=(https://www.svnkit.com/org.tmatesoft.svn_$pkgver.eclipse.zip)
md5sums=('fbc0551445510d74e85f422886220e5f')

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
