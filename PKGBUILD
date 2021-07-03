# PKGBUILD for pomodorino

# Maintainer: Göktuğ Kayaalp <self at gkayaalp dot com>
pkgname=pomodorino
pkgver=0.2.0a1
pkgrel=1
pkgdesc="a lightweight, simple Pomodoro timer system tray app"
arch=('any')
url=https://github.com/cadadr/pomodorino
license=('GPL')
depends=('python-gobject' 'python-notify2' 'dbus-python'
    'libindicator-gtk3')
makedepends=('python-setuptools' 'pandoc' 'gettext')

source=("$pkgname-$pkgver.tar.gz::https://github.com/cadadr/pomodorino/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb3ace34b005c1427bf6577ae70606121af1cc8c75bf6b6244b3a71a4d6ed512')

build() {
    cd "$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver/"
    # helps .pyc reproducibility
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
