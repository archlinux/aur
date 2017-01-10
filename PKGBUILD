# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Michael Lass <bevan@bi-co.net>
# Maintainer: David Rosenstrauch <darose@darose.net>
 
pkgname=eclipse-subclipse
pkgver=4.2.2
pkgrel=1
pkgdesc="Subversion integration for the Eclipse platform"
arch=('any')
url="https://github.com/subclipse/subclipse"
license=('EPL')
depends=('eclipse' 'subversion')
source=(https://dl.bintray.com/subclipse/releases/subclipse/subclipse-4.2.2.zip)
md5sums=('ebbc91a86b898c466dbde43dc499dfa1')

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
