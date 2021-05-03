# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync
pkgver=1.0.0
pkgrel=4
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64 aarch64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server libetebase)
makedepends=(cmake meson ninja vala intltool evolution)
_pkgname_ver="$pkgname-$pkgver"
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/${pkgver}/$_pkgname_ver.tar.gz"
        c75e4e0d2baef67dea73ef1e01fd860692e4c70e.diff)
sha256sums=('4e0daa9144962176e474d7f3acb03417d69057cea7fe5131381c7c5b68e6205d' 'SKIP')

prepare() {
  cd "$_pkgname_ver"
  patch --forward --strip=1 --input="${srcdir}/c75e4e0d2baef67dea73ef1e01fd860692e4c70e.diff"
}

build() {
  cd "$_pkgname_ver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname_ver"
  cd build
  make DESTDIR="${pkgdir}" install
}
