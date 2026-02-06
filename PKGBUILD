# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-jinja2-compat
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='Patches Jinja2 v3 to restore compatibility with earlier Sphinx versions'
arch=('any')
url='https://github.com/sphinx-toolbox/sphinx-jinja2-compat'
license=('MIT')
depends=(
  'python'
  'python-jinja2'
  'python-markupsafe'
  'python-sphinx-prompt'
)
makedepends=(
  'git'
  'python-whey'
  'python-whey-pth'
  'python-license-expression'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('a1b0ecc5dc9c03b55cecc83eb231e920221cd865152b27b0654256c48e9fc02a5e37444b46f9ed4a6ed9bd8cfaa2c15d2c9a54ab60585c53bde05fdd50f195ed')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m whey --wheel
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
