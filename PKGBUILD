# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.4.0
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
  'python-requests: ReDoS checks via external API'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
conflicts=('gixy' 'gixy-git' 'gixy-ng' 'gixy-ng-git')
_srcname="gixy_next-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/g/${pkgname}/${_srcname}.tar.gz")
b2sums=('5b4432f7473b9fe8e2e56c12a98d8522688ed3958ecbb9bb945784ca547030efb479096966b3d3cdad58dd8c32ae2d33b8c4c4fc0c0d23fa832edcb4f1a2b2fe')

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
  python -m installer --destdir="$pkgdir" "dist/${_srcname}-py3-none-any.whl"
}
