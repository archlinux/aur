# Maintainer:  Diego Martin Nieto Cid <dnietoc at gmail dot com>

pkgname=eclipse-luaeclipse
pkgver=1.2.0
pkgrel=1
pkgdesc="Eclipse plugin for the development of applications in the Lua programming language."
arch=('i686' 'x86_64')
url="http://luaeclipse.luaforge.net/"
license=('BSD')
depends=('eclipse')
source=(
	'http://luaforge.net/frs/download.php/3193/luaeclipse-1.2.0.zip'
	'LICENSE'
	)
md5sums=('f735a47b31186aac90aca30e485d00f5'
         '84e13cfae8aac2d34107f67fbec06ca7')

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

  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}


