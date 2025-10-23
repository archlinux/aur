# Maintainer:
# Contributor: leuko <aur202307_et_aydos_de>

pkgname="xpra-html5"
pkgver=18
pkgrel=1
pkgdesc="HTML5 client for Xpra"
url="https://github.com/Xpra-org/xpra-html5"
license=('MPL-2.0')
arch=('x86_64')

conflicts=("${pkgname}-git")

makedepends=(
  'git'
  'python'
  'brotli'    # compression for served files (.br)
  'gzip'      # compression for served files (.gz)
  'uglify-js' # for compressing Javascript
)

source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "fix_396.patch")

sha256sums=('16cef9dfefea574ee46bebedbb4f4c33dbe797c23099355646f51221905062d8'
            'b06934dfe110bc262eaed0eb3e1f5c0125ad32a6a7de7b022ed5a7a289341f68')

package() {
  # fixes https://github.com/Xpra-org/xpra-html5/issues/396
  patch -p0 < fix_396.patch

  cd "${pkgname}-${pkgver}"

  # custom script, *not* based on python-setuptools
  python setup.py install "${pkgdir}" # `args[2]` is `root_dir`
}
