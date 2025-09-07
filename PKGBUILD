pkgname=kodi-addon-pvr-hts
pkgbase=${pkgname}
_gitname=pvr.hts
pkgver=21.2.6

_gitver=branch=Omega
pkgrel=3
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' "kodi-dev>=${pkgver%%.*}")
depends=('kodi' 'p8-platform')
source=("git+https://github.com/kodi-pvr/${_gitname}.git#${_gitver}"
        '0001-Add-missing-include.patch')
md5sums=('SKIP'
         'c52453f0461a681a63c53585074fa26d')

_prefix='/usr'

prepare() {
  cd "$srcdir/$_gitname"
  git apply "${srcdir}/0001-Add-missing-include.patch"
}

build() {
  cd "$srcdir/$_gitname"
  cmake -S . -B build/ \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build/
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_gitname/build"
}
