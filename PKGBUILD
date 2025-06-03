# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=radian
pkgver=0.6.15
pkgrel=1
pkgdesc="A 21st century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0'
         'python-prompt_toolkit>3.0.41' 'python-prompt_toolkit<3.1'
         'python-rchitect>=0.4.8' 'python-rchitect<0.5.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-pyte python-pexpect python-ptyprocess python-pytest-runner)
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('ae672d840691b0f2304b6a507454325444ffee3d91e34dadfdb8a2090e124858')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check_disabled() { # may fail because of R profile
  cd "$pkgname-$pkgver"
  pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
