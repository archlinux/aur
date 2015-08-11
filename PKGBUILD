# Maintainer: Garrett <floft.net/contact>
pkgname=python2-pyocd-git
pkgver=v0.2.r153.g2d15688
pkgrel=1
pkgdesc="Python library for programming/debugging ARM Cortex-M microcontrollers using CMSIS-DAP"
arch=('any')
url="https://github.com/mbedmicro/pyOCD"
license=('Apache')
depends=('python2' 'python2-pyusb-beta')
makedepends=('git')
options=(!emptydirs)
source=("$pkgname::git+https://github.com/mbedmicro/pyOCD#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
        git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
