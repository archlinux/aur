# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Michael Lass <bevan@bi-co.net>
# Maintainer: David Rosenstrauch <darose@darose.net>
 
pkgname=eclipse-goclipse
pkgver=0.16.1
pkgrel=1
pkgdesc="Eclipse IDE for the Go programming language"
arch=('any')
url="https://github.com/GoClipse/goclipse"
license=('EPL')
depends=('eclipse' 'go')
source=(https://github.com/GoClipse/goclipse.github.io/archive/0.16.1.zip)
md5sums=('c831a3a121869c1a969e40245f4175b7')

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse

  _srcdir=${srcdir}/goclipse.github.io-${pkgver}/releases/local-repo
  cd ${_srcdir}

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${_srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
