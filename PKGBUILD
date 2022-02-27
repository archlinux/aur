# Maintainer: fzerorubigd <fzero@rubi.gd>

pkgname=yubipam-git
pkgver=r41.9427495
pkgrel=1
pkgdesc="YubiPAM is a module for PAM that provides support for One Time Passwords (OTP) authentication."
url="https://github.com/firnsy/yubipam"
arch=(any)
license=('GPL-2')
depends=()
makedepends=()
source=("git+https://github.com/fzerorubigd/yubipam.git")
md5sums=('SKIP')
provides=('yubipam')
pkgver() {
  cd "$srcdir/yubipam"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

install=$pkgname.install

package() {
    cd $srcdir/yubipam
    autoreconf -i
    ./configure
    make
    make DESTDIR=$pkgdir install
    mv $pkgdir/lib $pkgdir/usr/
}
