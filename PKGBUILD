# Contributor: Eric Fung <loseurmarbles [AT] gmail [DOT] com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: David Rosenstrauch <darose@darose.net>
 
pkgname=eclipse-subclipse
_pkgname=subclipse
pkgver=4.3.3
pkgrel=1
pkgdesc="Subversion integration for the Eclipse platform"
arch=('any')
url="https://github.com/subclipse/subclipse"
license=('EPL')
provides=('subclipse')
depends=('eclipse' 'subversion')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.zip")
sha256sums=('0d670315ab0db3d0ff29390bd55f5e5f9336c2aa07f8f660a2108448b692f9fc')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${_pkgname}/eclipse"

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
