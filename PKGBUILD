# Maintainer: Anton Karmanov <starcom24@gmail.com>
pkgname=stegosaurus-lv2
pkgver=0.0.3
pkgrel=3
pkgdesc="lv2 drum synthersizer without sampling"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname"
license=('BSD')
depends=('lv2' 'cairo')
makedepends=('python-virtualenv' 'python2')
source=("https://sourceforge.net/projects/$pkgname/files/Stegosaurus_LV2_${pkgver}.tar.gz")
md5sums=('fec688cf4eced6e0ade69ce4d8cd33cd')

prepare() {
    cd "stegosaurus-git"
    virtualenv -p python2 python2_env
    source python2_env/bin/activate
    python -V
}

build() {
    LDFLAGS="${LDFLAGS} -z muldefs"  # Ignore multiple defenitions
    cd "stegosaurus-git"
    ./waf configure --prefix=$pkgdir/usr
    ./waf build
}

package() {
    cd "stegosaurus-git"
    ./waf install
}
