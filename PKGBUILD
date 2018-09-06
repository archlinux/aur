# Maintainer: fft <anonim288@gmail.com>

pkgname=rpmlint-git
pkgver=1.10.r184.g3682eaf
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="https://github.com/rpm-software-management/rpmlint"
license=('GPL2')
makedepends=('git')
depends=('python' 'rpm-org' 'cpio' 'desktop-file-utils')
conflicts=('rpmlint')
source=("${pkgname}::git+https://github.com/rpm-software-management/rpmlint.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags| sed 's/rpmlint-\([0-9\.]*\)-\(.*\)/\1.r\2/;s/-/./g'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
    cd ${pkgname}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
