pkgname=python-usbtmc
pkgver=0.8
pkgrel=2
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('x86_64')
url="https://github.com/python-ivi/python-usbtmc"
license=(MIT)
depends=(
python-pyusb
)
makedepends=(
python-build
python-installer
python-wheel
)
install=python-usbtmc.install

source=(
"python-usbtmc-${pkgver}.tar.gz::https://github.com/python-ivi/python-usbtmc/archive/v${pkgver}.tar.gz"
python-usbtmc.sysusers
)
sha256sums=('dc13aa4ae0c0e4545e2ef83ae181d08528de176ee1522e6d66856449cf91c491'
            '3813bed7349a402231d291fe747cbe4b535081b8d39c33427701983a6bf08074')

build(){
    cd python-usbtmc-${pkgver}

    python -m build --wheel --no-isolation
}

package(){
    cd python-usbtmc-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 "${srcdir}"/python-usbtmc.sysusers "${pkgdir}"/usr/lib/sysusers.d/python-usbtmc.conf
    install -m 0644 -D usbtmc.rules "${pkgdir}"/etc/udev/rules.d/40-usbtmc.rules
    msg2 "Users might need to be added to the the usbtmc group to avoid permissions issues"
}

#package() {
#  cd "$srcdir/python-usbtmc-$pkgver"
#  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
#
#  install -m 0644 -D usbtmc.rules $pkgdir/etc/udev/rules.d/40-usbtmc.rules
#}

#package_python2-usbtmc() {
#  depends=('python2' 'python2-pyusb')
#
#  cd "$srcdir/python-usbtmc-$pkgver"
#  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
#}
