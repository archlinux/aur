# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=gplaycli
pkgver=0.1.2
pkgrel=1
pkgdesc="command line tool to search/install/update Android applications Google PlayStore able to run with cronjob, in order to automatically update an F-Droid server instance"
arch=('any')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python2')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matlink/gplaycli/archive/${pkgver}.tar.gz")
md5sums=('36c589d083ebf931b1af8538ef37d072')

package() {
    cd gplaycli-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
    sed -i 's$#!/usr/bin/env python$#!/usr/bin/env python2$' $pkgdir/usr//lib/python2.7/site-packages/ext_libs/androguard/core/bytecodes/libdvm/test_dvm.py
    sed -i 's$#!/usr/bin/python$#!/usr/bin/python2$' $pkgdir/usr//lib/python2.7/site-packages/ext_libs/googleplay_api/googleplay.py
}
