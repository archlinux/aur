# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.11.0
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url='https://gixy.io'
license=('MPL-2.0')
depends=(
  'crossplane-gixy'  # Maintained crossplane fork
  'python'
  'python-configargparse'
  'python-jinja'
  'python-tldextract'
)
optdepends=(
  'python-requests: ReDoS checks via external API'  # namcap gives false-positive warning
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
conflicts=('gixy' 'gixy-git' 'gixy-ng' 'gixy-ng-git')
_srcname="Gixy-Next-${pkgver}"
_distname="gixy_next-${pkgver}-py3-none-any.whl"
source=("${_srcname}.tar.gz::https://github.com/MegaManSec/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b4022984d7aedf0206de0848f93f8319f787ed9b287d318b254d8ec7f2817ff42a84769106a72c40cda394ede2fdd1380492b6dc8710494a7ba40c194da3bfe4')
b2sums=('514d924b049c163c07b216bbb02d33a68b56e705994f3f7a2907318b997ddbeba50bbb102916e43fdeed68d86724c6cedfb52d15eb862f92163a3a9200c134d9')

build() {
  cd "$_srcname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_srcname"
  pytest
}

package() {
  cd "$_srcname"
  python -m installer --destdir="$pkgdir" "dist/${_distname}"
}
