# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=raiseorlaunch
pkgver=2.2.1
pkgrel=0
pkgdesc="A run-or-raise-application-launcher for i3 window manager."
arch=(any)
url="https://github.com/open-dynaMIX/raiseorlaunch"
license=('MIT')
depends=('python' 'i3ipc-python-git')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/open-dynaMIX/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('abe9503833d4e52ca74641ee91f845012c0b884ae06f9c7723377fcba51e835e')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        # Need to create the wheel first, otherwise the generated entry script will be too slow
        python setup.py bdist_wheel
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps --no-warn-script-location dist/${pkgname}-${pkgver}-py3-none-any.whl
        install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
