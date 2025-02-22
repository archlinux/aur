# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=xkeysnail
pkgver=0.4.0
pkgrel=5
pkgdesc="Yet another keyboard remapping tool for X environment."
arch=('any')
url="https://github.com/mooz/xkeysnail"
license=('GPL')
depends=('python'
         'python-xlib'
         'python-evdev'
         'python-inotify-simple'
         'python-appdirs')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/x/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "events.patch"
        "evdev-1.9.0.patch")
sha256sums=('eed97123cc3181f47d2d0371a140e6eb780a7ed40c1b24b1ea95b38ebdb9d8f7'
            '6aaf409f103d0fc53bf1c92b7ee401279dca61e348841026d761f08e5a924723'
            '866867242593c215fb47daf8536b3e68e05d24022b9ca574b9e09c004f5d38ce')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/events.patch"
    patch -Np1 -i "${srcdir}/evdev-1.9.0.patch"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
