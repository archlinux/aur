# Maintainer: fft <anonim288@gmail.com>

pkgname=rpmlint-git
pkgver=1.9.r43.ge9e447c
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="https://github.com/rpm-software-management/rpmlint"
license=('GPL2')
makedepends=('git')
checkdepends=('python-pytest' 'flake8')
depends=('python' 'rpm-org' 'cpio' 'desktop-file-utils')
source=("${pkgname}::git+https://github.com/rpm-software-management/rpmlint.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags| sed 's/rpmlint-\([0-9\.]*\)-\(.*\)/\1.r\2/;s/-/./g'
}

check() {
    cd ${pkgname}
    make check
}

package() {
    cd ${pkgname}
    make COMPILE_PYC=1 DESTDIR="${pkgdir}" install
}
