# Maintainer: SZanko, szanko at protonmail dot com

pkgbase="mailchecker"
pkgname=(
	#"go-mailchecker"
	#"nodejs-mailchecker"
	#"php-mailchecker"
	"python-mailchecker"
	#"ruby-mailchecker"
	#"rust-mailchecker"
)
_pkgname="mailchecker"
pkgver="4.0.8"
pkgrel="1"
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='https://github.com/FGRibreau/mailchecker/'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a23b2d67be49a7bb50eb1ee026412634189150b01051550a6de382489da24590')
makedepends=(
'python-distribute'
'nodejs'
'npm'
)


build() {
  msg "Generate List"
  cd "$srcdir/${_pkgname}-${pkgver}"
  npm install && npm run build
  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python setup.py build
}


package_python-mailchecker() {
  depends=(
	'python-distribute'
  )
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/python-mailchecker/LICENSE.txt"
}
