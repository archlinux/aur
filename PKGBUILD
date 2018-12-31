# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname='python-black-git'
pkgver=18.9b0.r13.ge4e59f8
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url='https://github.com/ambv/black'
license=('MIT')
depends=('python-appdirs' 'python-attrs' 'python-click' 'python-setuptools'
         'python-toml')
checkdepends=('python-aiohttp')
makedepends=('git')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  python setup.py build
}

check() {
  cd "${pkgname}"

  python -m unittest tests/test_black.py
}

package() {
  cd "${pkgname}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
