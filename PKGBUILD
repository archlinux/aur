# $Id: PKGBUILD 3892 2009-10-12 00:36:29Z cprimier $
# Maintainer: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Frank Oosterhuis <frank@scriptzone.nl>

pkgname=eclipse-phpeclipse
_reldate=200910091456
pkgver=1.2.3
pkgrel=1
pkgdesc="PHP - Support for the Eclipse IDE Framework"
arch=('any')
url="http://www.phpeclipse.com/"
license=('CPL')
depends=('eclipse')
source=("http://downloads.sourceforge.net/phpeclipse/PHPEclipse-${pkgver}.${_reldate}PRD-bin.zip")
md5sums=('979626fc167a77f019c729be91e3af60')

build() {
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
