# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname=nemo-compare
pkgver=4.0.0
pkgrel=3
pkgdesc="Context menu comparison extension for Nemo file manager"
arch=("x86_64")
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo>=4.0' 'nemo-python>=4.0' 'python2-xdg' 'pygtk')
groups=('nemo-extensions')
optdepends=('kompare: Comparison options (preferred diff, three-way, multi-compare)'
	    'fldiff: Comparison options (preferred diff, three-way, multi-compare)'
	    'diffuse: Comparison options (preferred diff, three-way, multi-compare)'
	    'meld: Comparison options (preferred diff, three-way, multi-compare)'
	    'kdiff3: Comparison options (preferred diff, three-way, multi-compare)'
	    'tkdiff: Comparison options (preferred diff, three-way, multi-compare)')
install=${pkgname}.install
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('4bee7336554fd3c6e87371bc4683e5bee989a67030582b89a050aad5874a04de')


build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  install -D src/* -t "${pkgdir}/usr/share/${pkgname}/"

  install -d "${pkgdir}/usr/share/nemo-python/extensions"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/nemo-compare/nemo-compare-preferences "${pkgdir}/usr/bin/nemo-compare-preferences"
}
