# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Elia A. <elia@elinvention.ovh>
pkgname=efiboots-git
pkgver=2.1.0.r24.g7c90dc6
pkgrel=1
pkgdesc="Manage EFI boot loader entries with this simple GUI"
arch=('any')
url="https://github.com/Elinvention/efiboots"
license=('GPL-3.0-only')
depends=(
  'efibootmgr'
  'gtk4'
  'python-gobject'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Elinvention/efiboots.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
