# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=rapidlauncher-git
_pkgname=RapidLauncher
pkgrel=1
pkgver=r95.44bc2f9-1
pkgdesc="Git official release"
arch=('i686' 'x86_64')
url="https://github.com/echo-devim/RapidLauncher"
license=('GPL')
depends=('gtk3' 'vala')
provides=('rapidlauncher')
conflicts=('rapidlauncher')
source=("git+https://github.com/echo-devim/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
 cd "$srcdir/$_pkgname"
 sed -i 's/\"\/usr/\"\$\(DESTDIR\)\/usr/g' misc/Makefile
 make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

