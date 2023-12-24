# Maintainer: efindus <aur at efindus dot com>

pkgname=power-profiles-daemon-patched-amd-git
_pkgname=power-profiles-daemon
pkgver=0.13
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus (with AMD patches by Mario Limonciello)"
url="https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/tree/?h=f39"
license=(GPL3)
arch=(x86_64)
depends=('upower' 'polkit')
optdepends=('python-gobject: for powerprofilesctl')
makedepends=('git' 'meson' 'ninja')
checkdepends=('python-dbusmock' 'python-pylint' 'umockdev')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("https://gitlab.freedesktop.org/hadess/power-profiles-daemon/uploads/1f2ea40547b2af8d255875d7085211e5/power-profiles-daemon-0.13.tar.xz" "https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/merge_requests/127.patch" "https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/merge_requests/128.patch" "https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/merge_requests/129.patch")
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/127.patch"
    patch --forward --strip=1 --input="${srcdir}/128.patch"
    patch --forward --strip=1 --input="${srcdir}/129.patch"
}

build() {
  arch-meson "$_pkgname-$pkgver" _build
}

check() {
  meson test -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -v -C _build install
}
