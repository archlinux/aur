# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>
pkgname=eclipse-jdt
pkgver=4.5
pkgdate=201506032000
pkgrel=1
pkgdesc="Java Development Tools - Separated from Eclipse SDK package. Use with eclipse-platform"
url="http://www.eclipse.org/jdt/"
arch=('any')
license=('EPL')
depends=('eclipse>=4.5')
makedepends=('unzip')
options=(!strip)
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/eclipse/downloads/drops4/R-${pkgver}-${pkgdate}/org.eclipse.jdt-${pkgver}.zip")
sha512sums=('c2b69941f8af91da0c8deb78273e4da71514985efea82550ec1fb8c4af068b0cc9cb383f695434ca154f7518fbaa57c4d301be452b50dd95e1f461b45e345f81')

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
