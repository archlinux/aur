# Maintainer: TwoLeaves < ohneherren at gmail dot com >

pkgname=nzbget-ppscript-nzbtomedia-git
pkgver=1712.3e4861e
pkgrel=1
pkgdesc="Post-processing scripts to communicate with media managers."
arch=(any)
url="https://github.com/clinton-hall/nzbToMedia"
license=('GPL3')
depends=('nzbget' 'python2')
makedepends=('git')
optdepends=('couchpotato' 'headphones' 'mylar-git' 'sickbeard'
	    'ffmpeg: to use the transcoding option')
install=install
source=("git://github.com/clinton-hall/nzbToMedia.git")
sha256sums=('SKIP')

pkgver() {
  cd nzbToMedia
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    rm -rf ${srcdir}/nzbToMedia/.git*
    sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${srcdir} -name '*.py')
}

package() {
    install -dm755 ${pkgdir}/usr/share/doc/nzbget/ppscripts/nzbtomedia
    mv ${srcdir}/nzbToMedia/{changelog.txt,license.txt,README.md} ${pkgdir}/usr/share/doc/nzbget/ppscripts/nzbtomedia

    install -dm755 ${pkgdir}/usr/share/nzbget/ppscripts
    cp -a ${srcdir}/nzbToMedia/* ${pkgdir}/usr/share/nzbget/ppscripts
}
