# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
 
pkgname=eclipse-subclipse
pkgver=1.10.5
pkgrel=1
_urlver=49382
pkgdesc="Subversion integration for the Eclipse platform"
arch=('any')
url="http://subclipse.tigris.org/"
license=('EPL')
depends=('eclipse' 'subversion')
source=(http://subclipse.tigris.org/files/documents/906/${_urlver}/site-${pkgver}.zip)
md5sums=('5537c75cf09189351672a8807cb75d61')
 

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

# vim:set ts=2 sw=2 et:
