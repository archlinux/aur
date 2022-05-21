# Maintainer: Buce <dmbuce@gmail.com>
pkgname=python-transliterate
pkgver=1.10.2
pkgrel=2
pkgdesc="Bi-directional transliterator for Python"
arch=('any')
url="https://pypi.org/project/transliterate/"
license=('GPL2' 'LGPL2.1')
depends=(python)
makedepends=()
#checkdepends=()
optdepends=()
provides=()
conflicts=()
backup=()
install=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bc608e0d48e687db9c2b1d7ea7c381afe0d1849cad216087d8e03d8d06a57c85')

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0].lstrip('/'))")
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "$_name"
  python -O -m compileall "$pkgdir/$site_packages/$_name"
  rm -rf "$pkgdir/$site_packages/$_name/tests"
}

# vim:set ts=2 sw=2 et:
