# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=3.4.0
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
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2'
            '52e9f55e4f05671607a458f33021e8d04f04e58149965e4ca3165288ac724e94')

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
