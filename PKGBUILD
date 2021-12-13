# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pypyr
pkgver=5.0.0
pkgrel=2
pkgdesc="Task runner for automation pipelines"
arch=('any')
url="https://pypyr.io"
license=('Apache')
depends=('python' 'python-dateutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypyr/pypyr/archive/v$pkgver.tar.gz")
sha512sums=('68488b18564a747cc5aeef095d208ce7d1110d4b6dd9ec121c10dc1bcbd0c61fc0841ab0d2bf0fb21e4a7e164186e7fc19cab09b016e1afb7f906d94f0ad7f71')
b2sums=('02213356854a1dee813df513c66ab5da2fb1ce8f6c03de317116c99c2035ac56efc68795640f35fec808483dfe08be2631792afe35668c5b0e11951e14e8fad8')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  # delete tests folder
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"
}
