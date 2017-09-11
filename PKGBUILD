# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname=nemo-compare
pkgver=3.4.0
pkgrel=2
pkgdesc="Context menu comparison extension for Nemo file manager"
arch=("any")
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo>=3.2' 'nemo-python>=1.0' 'python2-xdg' 'pygtk')
groups=('nemo-extensions')
optdepends=('diffuse: Additional comparison options (preferred diff, three-way, multi-compare)'
	   'kompare: Additional comparison options (preferred diff, three-way, multi-compare)'
	   'fldiff: Additional comparison options (preferred diff, three-way, multi-compare)')
install=${pkgname}.install
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2')


package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  install -D data/nemo-compare-preferences.desktop -t "${pkgdir}/usr/share/applications"
  install -D data/nemo-compare-notification -t "${pkgdir}/usr/share/${pkgname}"
  install -D src/* -t "${pkgdir}/usr/share/${pkgname}/"

  install -d "${pkgdir}/usr/share/nemo-python/extensions"
  install -d "${pkgdir}/usr/bin"

  ln -s /usr/share/nemo-compare/nemo-compare.py "${pkgdir}/usr/share/nemo-python/extensions/nemo-compare.py"
  ln -s /usr/share/nemo-compare/nemo-compare-preferences.py "${pkgdir}/usr/bin/nemo-compare-preferences"
}
