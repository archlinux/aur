# Maintainer: Ciptik <stepan.ciptik@yandex.ru>
# Contributor: AGLExport <https://github.com/AGLExport>

pkgname=drm-lease-manager-git
pkgver=r1.0.1.0
pkgrel=2
pkgdesc="DRM Lease Manager"
arch=('x86_64')
url="https://github.com/AGLExport/drm-lease-manager"
license=('Apache-2.0')
depends=('libdlmclient-git' 'tomlc99-git' 'libdrm')
makedepends=('git' 'meson' 'ninja' 'doxygen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!debug')
source=("${pkgname}::git+https://gerrit.automotivelinux.org/gerrit/src/drm-lease-manager")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  arch-meson build --prefix=/usr -Druntime_subdir=/var/run/drm-lease-manager
  ninja -C build
}

package() {
  cd "$srcdir/${pkgname}/build"
  install -Dm755 drm-lease-manager/drm-lease-manager -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
