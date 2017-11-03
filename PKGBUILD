# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=3.6.0
_mintrel='betsy'
pkgrel=1
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'mutagen' 'python2-exiv2' 'kaa-metadata' 'python2-pypdf' 'python2-pillow')
options=('!emptydirs')
#source=("${_pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${pkgver}+${_mintrel}.tar.xz"
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz"
        'pillow.patch')
sha256sums=('593aaf206ef50a8185e1f71c9018ce6a8b4bcb82b4684494e069f9045ba11fd1'
            '0d5e4e950bf7034704c0fc8b477ea916f20bac019951bad254fc74d35ca56467')

prepare() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Use pillow library for Image
  patch -uNp2 -r- -i ${srcdir}/pillow.patch
}

package() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  install -Dm644 nemo-media-columns.py ${pkgdir}/usr/share/nemo-python/extensions/nemo-media-columns.py
}
