# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync
pkgver=1.1.1
pkgrel=1
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64 aarch64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server libetebase)
makedepends=(cmake meson glib2-devel ninja vala intltool evolution)
_pkgname_ver="$pkgname-$pkgver"
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/${pkgver}/$_pkgname_ver.tar.gz")
sha256sums=('6b7d6b113a4d35307fc1d178f7fc3d2b4143ee5dfebae3f15467a5788cb4316c')

#prepare() {
#  cd "$_pkgname_ver"
#  patch --forward --strip=1 --input="${srcdir}/c75e4e0d2baef67dea73ef1e01fd860692e4c70e.diff"
#}

build() {
  cd "$_pkgname_ver"
  mkdir -p build
  cd build
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname_ver"
  cd build
  make DESTDIR="${pkgdir}" install
}
