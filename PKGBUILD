# Maintainer: Radon Rosborough <radon@radian.codes>

pkgname=objection
pkgver=1.12.2
pkgrel=1
pkgdesc='Runtime mobile exploration toolkit powered by Frida'
arch=('any')
url="https://github.com/sensepost/$pkgname"
license=('GPLv3')
depends=(
  'python>=3.10'

  'python-click>=8.2.0'
  'python-delegator>=0.1.1'
  'python-flask>=3.0.0'
  'python-frida>=16.0.0'
  'python-frida-tools>=10.0.0'
  'litecli>=1.3.0'
  'python-packaging>=23.0'
  'python-prompt_toolkit>=3.0.30'
  'python-prompt_toolkit<4.0.0'
  'python-pygments>=2.0.0'
  'python-requests>=2.32.0'
  'python-semver>=2'
  'python-setuptools>=70.0.0'
  'python-tabulate>=0.9.0'
)
makedepends=(python-build python-installer uv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('89b809b99cb10e05ab5a7f1855ab920ce98d491976ba5f52a79fb974a3ec8e92')

# No check() because upstream tests do not pass
# https://github.com/sensepost/objection/issues/780

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
