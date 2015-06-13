pkgname=python2-pywavelets-git
pkgver=0.2.2.r410.7ea3e91
pkgrel=1
pkgdesc="PyWavelets, wavelet transform module. From rgommers branch"
arch=('i686' 'x86_64')
url="https://github.com/rgommers/pywt"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'cython2' 'unzip')
options=(!emptydirs)
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/rgommers/pywt.git#branch=master)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(head -n4 CHANGES.txt | grep 0. | awk '{print $1}' | sed 's/v//;s/-/./').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $pkgname/
    python2 setup.py build
}

package() {
    cd $pkgname/
    python2 setup.py install --root="$pkgdir" --optimize=1
}