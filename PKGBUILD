# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.0.8
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
sha256sums=('276eea4f85a8266a85704944db5cfdf9c2b610d771a3a26efa570da4d2d0b25c')

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
