# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>
# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname='black-git'
pkgver=18.6b4.r7.ge94a41f
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url='https://github.com/ambv/black'
license=('MIT')
depends=('python-appdirs' 'python-attrs' 'python-click' 'python-toml')
makedepends=('git' 'python-setuptools')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname/-git}"

  python setup.py build
}

package() {
  cd "${pkgname/-git}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
