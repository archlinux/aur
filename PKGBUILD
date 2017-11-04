# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=raiseorlaunch
pkgver=0.1.2
pkgrel=0
pkgdesc="Run-or-raise-application-launcher for i3 window manager."
arch=(any)
url="https://github.com/open-dynaMIX/raiseorlaunch"
license=('MIT')
depends=('python' 'python-i3-py')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/open-dynaMIX/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0203371a92993dcfa61e7be7c9b28d08bc6f75d1f63ebf0fab2ef79e55b1397c')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        # Need to create the wheel first, otherwise the generated entry script will be too slow
        python setup.py bdist_wheel
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/${pkgname}-${pkgver}-py2.py3-none-any.whl
        install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
