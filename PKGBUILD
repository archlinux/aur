# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Anselmo L. S. Melo <anselmo.melo@intel.com>

pkgname=trufont-git
pkgver=0.6.3.r18.ge8d731e
pkgrel=2
pkgdesc='A streamlined and hackable font editor'
arch=('any')
url='https://trufont.github.io'
license=('GPL3' 'LGPL3')
_pydeps=('appdirs'
         'booleanoperations'
         'brotli'
         'compreffor'
         'cu2qu'
         'defcon'
         'fonttools'
         'fs'
         'hsluv'
         'lxml'
         'pyclipper'
         'pyqt5'
         'pyqt5-sip'
         'pytz'
         'six'
         'ufo-extractor'
         'ufo2ft'
         'unicodedata2'
         'zopfli')
depends=('python' "${_pydeps[@]/#/python-}")
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+https://github.com/${pkgname%-git}/${pkgname/-/.}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --abbrev=7 --match="[0-9]*" HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
	python setup.py build
}

check() {
    cd "${pkgname%-git}"
	# python setup.py test
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
