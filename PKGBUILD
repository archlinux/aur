# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>

pkgname=raiseorlaunch
pkgver=2.0.0
pkgrel=0
pkgdesc="A run-or-raise-application-launcher for i3 window manager."
arch=(any)
url="https://github.com/open-dynaMIX/raiseorlaunch"
license=('MIT')
depends=('python' 'i3ipc-python-git')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/open-dynaMIX/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8d82b8bbc432fa790d0cd69dfd842aa6a3f54fd28dfa334f6a62008a982bbd81')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        # Need to create the wheel first, otherwise the generated entry script will be too slow
        python setup.py bdist_wheel
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/${pkgname}-${pkgver}-py3-none-any.whl
        install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
