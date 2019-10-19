# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=raiseorlaunch
pkgver=2.3.3
pkgrel=1
pkgdesc="A run-or-raise-application-launcher for i3 window manager."
arch=(any)
url="https://github.com/open-dynaMIX/raiseorlaunch"
license=('MIT')
depends=('python' 'python-i3ipc')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/open-dynaMIX/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8d7687399f24bbb3fd698cc0cfe1a70a5d9d84bc08c4d35f99356ee7e914f619')

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
