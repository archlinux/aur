# Maintainer: keemcophoff
pkgname=apm-git
pkgver=0.35.1.r76.g4782e389d
pkgrel=1
pkgdesc='Agent Package Manager (microsoft/apm) built from git'
arch=('any')
url='https://github.com/microsoft/apm'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-yaml'
  'python-requests'
  'python-urllib3'
  'python-certifi'
  'python-truststore'
  'python-frontmatter'
  'python-tomli'
  'python-toml'
  'python-tomlkit'
  'python-rich'
  'python-rich-click'
  'python-watchdog'
  'python-gitpython'
  'python-ruamel-yaml'
  'python-filelock'
  'python-websockets'
  'git'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('apm')
conflicts=('apm')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match 'v*' | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$pkgname"
  rm -rf dist
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
