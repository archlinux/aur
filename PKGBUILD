# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pypyr
pkgver=5.1.0
pkgrel=1
pkgdesc="Task runner for automation pipelines"
arch=('any')
url="https://pypyr.io"
license=('Apache')
depends=('python' 'python-dateutil' 'python-ruamel-yaml' 'python-tomli' 'python-tomli-w')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pypyr/pypyr/archive/v$pkgver.tar.gz")
sha512sums=('ba8d4a91c1680cca909d8d5c3f041485cb8c8df4e26a4f173e29924e078014e485fcdad2848d844989f93494949d30cebd20b6b8a3e716db192d4f4d1fd5ef92')
b2sums=('33d8c5f893d7321cd41c04826f891c6152ea691b75e65344c3275ad3be6b9e34a7da7ddf5dfc38151a5da3750367a206a5d24fe342ea8779c08d096ceea8ba49')

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
