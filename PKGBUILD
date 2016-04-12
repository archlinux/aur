# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.0.6
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
depends=('mint-x-icons>=1.2.1')
makedepends=('python2-distutils-extra')
optdepends=('nemo-python: Nemo extension'
            'python2-caja: Caja extension')
options=('!libtool' '!emptydirs')

source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('583d50e33d60d13f8460e2aa63134afee966b61526181b67b6e5bdb2c0681e75')

prepare() {
  cd ${srcdir}/${pkgname}
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            $(find . -name '*.py')
}

package() {
  cd ${srcdir}/${pkgname}
  python2 ./setup.py install --root="${pkgdir}"
  install -d -m755 "$pkgdir"/usr/share/icons/hicolor/22x22/apps
  find ${srcdir}/${pkgname}/icons -name *png -exec \
       install -Dm644 '{}' "$pkgdir"/usr/share/icons/hicolor/22x22/apps/ \;
}
