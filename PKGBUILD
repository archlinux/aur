# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=xkeysnail
pkgver=0.4.0
pkgrel=3
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
        "events.patch")
sha256sums=('eed97123cc3181f47d2d0371a140e6eb780a7ed40c1b24b1ea95b38ebdb9d8f7'
            '6aaf409f103d0fc53bf1c92b7ee401279dca61e348841026d761f08e5a924723')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/events.patch"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
