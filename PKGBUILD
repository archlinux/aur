# Maintainer: Torsten Sadowski <tsadowski at gmx dot net>

pkgname=libspnav-git
_pkgname=libspnav
pkgver=r39.79ad169
pkgrel=1
pkgdesc="Alternative to the proprietary 3Dconnexion device driver and SDK for their 3D input devices"
arch=(x86_64)
url='https://spacenav.sourceforge.net/'
license=(GPL)
depends=(libx11)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/FreeSpacenav/libspnav.git"
        )
sha256sums=('SKIP'
            )

pkgver() {
    cd "$srcdir"/"$_pkgname"
    printf "r%s.%s"  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr \
    --disable-debug
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
