# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=snagboot
pkgver=3.0
pkgrel=1
pkgdesc='Generic recovery and reflashing tool for embedded platforms'
arch=(any)
url='https://github.com/bootlin/snagboot'
license=('GPL2')
depends=('dtc>=1.7.2'             # for pylibfdt
         'python>=3.8'
         'python-crccheck>=1.3.0'
         'python-kivy>=2.3.0'
         'python-packaging>=24.2'
         'python-pyserial>=3.5'
         'python-pyusb>=1.2.1'
         'python-tftpy>=0.8.2'
         'python-xmodem>=0.4.6'
         'python-yaml>=6.0')
makedepends=('python-build'
             'python-installer'
             'python-setuptools>=61.0'
             'python-wheel')
install=$pkgname.install
source=("$url/archive/v$pkgver.tar.gz"
        $pkgname.sysusers)
b2sums=('57a616afea2ce06c128ba476ce2525890fd040bdc2143b3a675404d761516e8894b2516767351f31ae83d41f444fa7a60001fc8c09b3337e602f3aff12083b43'
        'f48705e2a98ec318e26a4a1f01bafabbd8ab74622c7209be9cbae34bb0ccc999d6581b0fa5c827ab7a8bd41d6f32d32c4a2ed642342279308362953018843138')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dt "$pkgdir/etc/udev/rules.d" src/snagrecover/50-snagboot.rules
}
