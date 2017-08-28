# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=libcloudproviders
_pkgname=libcloudproviders
pkgver=0.1.0.r44.g94b55c6
pkgrel=1
pkgdesc="foo"
arch=(i686 x86_64)
url="https://github.com/juliushaertl/libcloudproviders"
license=(GPL3)
depends=('glib2>=2.51.2')
makedepends=(meson)
#provides=("$_pkgname=$pkgver")
#conflicts=("$_pkgname")
provides+=("dbus-org.freedesktop.CloudProviderManager.service")
source=("git+https://gitlab.gnome.org/External/libcloudproviders.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

build() {
  cd "$_pkgname"
  rm -rf build
  meson build -Dprefix=/usr
  ninja -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2:sw=2:et
