# Maintainer: 1ridic <i@iridium.cyou>
_pkgname=snowglobe
pkgname=${_pkgname}-git
pkgver=r52.262dbd2
provides=('snowglobe')
conflicts=('snowglobe')
license=('GPL3')
pkgrel=1
pkgdesc="Virtualization viewer using QEMU over DBus"
arch=(x86_64)
url="https://gitlab.gnome.org/bilelmoussaoui/snowglobe/"
depends=(gtk4 glib2 desktop-file-utils)
makedepends=(gcc meson)
source=("git+https://gitlab.gnome.org/bilelmoussaoui/snowglobe.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  meson _build --prefix=${pkgdir}/usr -Dlibmks:introspection=disabled
  ninja -C _build

}

package() {
  cd "${_pkgname}"
  ninja -C _build install
  rm -f ${pkgdir}/usr/share/applications/mimeinfo.cache 
  rm -f ${pkgdir}/usr/share/icons/hicolor/icon-theme.cache

}


