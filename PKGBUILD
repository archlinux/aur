# Maintainer: TwoLeaves < ohneherren at gmail dot com >

pkgname=nzbget-ppscript-nzbtomedia-git
pkgver=1712.3e4861e

pkgrel=1
arch=(any)
pkgdesc="Post-processing scripts to communicate with media managers."
url="https://github.com/clinton-hall/nzbToMedia"
license=('GPL3')
depends=('nzbget' 'python2')
makedepends=('git')
optdepends=('couchpotato' 'headphones' 'mylar-git' 'sickbeard'
	    'ffmpeg: to use the transcoding option')
install=install
_gitname=nzbToMedia
source=("git://github.com/clinton-hall/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"
  sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${srcdir} -name '*.py')
}

package() {
  install -Dm644 "${_gitname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -dm755 ${pkgdir}/usr/share/nzbget/ppscripts
  cp -a ${_gitname}/* ${pkgdir}/usr/share/nzbget/ppscripts
}
