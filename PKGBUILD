# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=snagboot
pkgver=1.2
pkgrel=1
pkgdesc='Generic recovery and reflashing tool for embedded platforms'
arch=(any)
url='https://github.com/bootlin/snagboot'
license=('GPL2')
depends=('dtc>=1.7.0'             # for pylibfdt
         'python>=3.8'
         'python-crccheck>=1.3.0'
         'python-hid>=1.0.4'      # pulls the required libhidapi
         'python-pyserial>=3.5'
         'python-pyusb>=1.2.1'
         'python-six>=1.16.0'
         'python-tftpy>=0.8.2'
         'python-xmodem>=0.4.6'
         'python-yaml>=6.0'
         'swig>=4.1.1')
makedepends=('python-build'
             'python-installer'
             'python-setuptools>=61.0'
             'python-wheel')
install=$pkgname.install
source=("$url/archive/v$pkgver.tar.gz"
        $pkgname.sysusers)
b2sums=('4c00d636009ab24dc5af36b24ac6c4072ad031e11933aa8465889536b86446c8c8792bcf67d5aa3f45e35c339773be7b9065b774d7527dff803f18beeab10613'
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
