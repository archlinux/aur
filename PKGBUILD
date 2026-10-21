# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.9.0
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
b2sums=('9589ab4d4eb2f4bfb3bb144af2cf2e4896b5c012498da0e4ea7be2a770ceadd879364232837fbd51cc281abcae3ff755aa9914d85e5f325920cd25715df5aede')
sha512sums=('a1f949d8781e4d4029e27ce18cae1d6015e826d2689d262c79de0af0b03d2662292b2c9a08ca398f9c4a8c50508a7d343b3ee866194b82077d7f0573e9573d03')

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
