# Maintainer: Richard Davis < davisrichard437 at gmail dot com >
pkgname='xsudo-git'
pkgver=1.0.1_r0_g672bf02
pkgrel=2
pkgdesc='A script to run GUI applications with pkexec'
arch=('any')
url='https://gitlab.com/davisrichard437/xsudo'
license=('MIT')
depends=('bash' 'polkit' 'coreutils')
makedepends=('git')
provides=('xsudo')
source=('xsudo::git+https://gitlab.com/davisrichard437/xsudo.git')
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/xsudo/"
    sed -i 's/pkgname=xsudo/pkgname=xsudo-git/g' ./Makefile
}

pkgver() {
    cd "$srcdir/xsudo/"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/_/g'
}

package() {
    cd "$srcdir/xsudo/"
    make DESTDIR="$pkgdir" PREFIX="/usr/" install
}
