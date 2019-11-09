# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-sql-explorer
pkgver=3.6.2
pkgrel=2
pkgdesc="SQL Explorer plugin for Eclipse IDE"
arch=('any')
url="https://sourceforge.net/projects/eclipsesql/"
license=('LGPL2.0')
depends=('eclipse>=4.5.0')
options=('!strip')
source=("download.zip::https://downloads.sourceforge.net/project/eclipsesql/SQL%20Explorer%20Plugin/$pkgver/sqlexplorer_plugin-$pkgver.zip")
sha256sums=('05c4a361fab1ddf4105bd29096acba19aafd818de19767e20c61df08e243849b')

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

