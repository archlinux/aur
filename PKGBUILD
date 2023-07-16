# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-dacite'
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=2
pkgdesc="Simplify creation of data classes (PEP 557) from dictionaries."
url="https://github.com/konradhalas/dacite"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  )
source=("${_name}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        )
sha256sums=('791ac3da85a040684a96df59e2320dc7b3cac000ff536e3f4b00fb3b67520b86')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file (cf. PKGBUILD for python-black)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
