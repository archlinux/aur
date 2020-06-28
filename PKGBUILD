# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=xkeysnail
pkgver=0.3.0
pkgrel=4
pkgdesc="Yet another keyboard remapping tool for X environment."
arch=('any')
url="https://github.com/mooz/xkeysnail"
license=('GPL')
depends=('python'
         'python-xlib'
         'python-evdev'
         'python-inotify-simple')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/x/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "revert.patch")
sha256sums=('0eaff456508b06a1daad6408e2fe91828af988d591a165e6d863ef116bc60a3e'
            '67fe4f70ffbb229dd1cf9db3f4040220760e0d7cabefde37da4466779069631c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "${srcdir}/modifiers.patch"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
