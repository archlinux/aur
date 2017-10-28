# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=raiseorlaunch
pkgver=0.1.1
pkgrel=4
pkgdesc="Run-or-raise-application-launcher for i3 window manager."
arch=(any)
url="https://github.com/open-dynaMIX/raiseorlaunch"
license=('MIT')
depends=('python' 'python-i3-py')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/open-dynaMIX/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c2984485721479404f397d4496792a2f6b5894a291cac6768049232aedf9de26')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Need to create the wheel first, otherwise the generated entry script will be too slow
  python setup.py bdist_wheel
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/${pkgname}-${pkgver}-py2.py3-none-any.whl
}
