# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=3.2.1
_mintrel='betsy'
pkgrel=1
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'mutagen' 'python2-exiv2' 'kaa-metadata' 'python2-pypdf' 'python2-pillow')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.xz"
        'pillow.patch')

sha256sums=('06ec025d5e0a255937115ac280559d3b85f4ea6db8ec08b8c46a7c081bc06323'
            '52e9f55e4f05671607a458f33021e8d04f04e58149965e4ca3165288ac724e94')

prepare() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Use pillow library for Image
  patch -uNp2 -r- -i ../pillow.patch
}

package() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  install -Dm644 nemo-media-columns.py ${pkgdir}/usr/share/nemo-python/extensions/nemo-media-columns.py
}
