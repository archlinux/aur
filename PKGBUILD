# Maintainer: Phillip Dykman <phil.d324@gmail.com>
_name=keepassxc-cli
pkgname=python-$_name
# renovate: datasource=pypi depName=keepassxc-cli
pkgver=3.0.0
pkgrel=1
pkgdesc='CLI for KeePassXC using the browser extension protocol with biometric unlock (kpxc-cli)'
arch=('any')
url="https://github.com/mietzen/$_name"
license=('MIT')
depends=('python' 'python-keepassxc-browser-api' 'python-pyperclip')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=('keepassxc: the password manager this talks to')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6635f0d3405d05247b5556e98442462f365185a15fd1311c726802fba8458dfa')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
