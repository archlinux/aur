# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=nemo-media-columns
_mintrel=betsy
pkgver=3.0.0
pkgrel=1
pkgdesc="Nemo extension to display music/EXIF and PDF metadata info"
arch=(any)
url="http://packages.linuxmint.com/pool/main/n/nemo-media-columns/"
license=(GPL)
depends=('nemo>=3.0' 'nemo<3.1' 'mutagen' 'nemo-python' 'python2-exiv2' 'python2-pillow' 'python2-pypdf')
source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.xz"
        fixes.patch)
md5sums=('316e8d7b14fade3e227c5a693f3837b2'
         '967e13e185e0a082ce5dd258cd0d9916')

prepare() {
  cd "${pkgname}-${pkgver}+${_mintrel}"

  # Python2 fix
#  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  sed -i "s|^\(#!.*python\)$|\12|" nemo-media-columns.py
  patch -p1 -i ../fixes.patch
}

package() {
  cd "${pkgname}-${pkgver}+${_mintrel}"

  install -dm755 "${pkgdir}/usr/share/nemo-python/extensions/"
  install -m644 nemo-media-columns.py "${pkgdir}/usr/share/nemo-python/extensions/"
}
