# Maintainer: efindus <aur at efindus dot com>

pkgname=power-profiles-daemon-patched-amd-git
_pkgname=power-profiles-daemon
pkgver=0.13
pkgrel=3
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
source=("https://gitlab.freedesktop.org/hadess/power-profiles-daemon/uploads/1f2ea40547b2af8d255875d7085211e5/power-profiles-daemon-0.13.tar.xz" "https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/plain/0001-tests-Split-immutable-control-into-a-test-helper.patch?h=f39" "https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/plain/0002-Allow-both-CPU-and-platform-drivers-to-be-simultaneo.patch?h=f39" "https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/plain/0003-Update-integration-test-to-be-compatible-with-pm-pro.patch?h=f39" "https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/plain/0004-Disable-loading-amd-pstate-when-the-PM-profile-is-a-.patch?h=f39" "https://copr-dist-git.fedorainfracloud.org/cgit/mariolimonciello/power-profiles-daemon/power-profiles-daemon.git/plain/0005-Don-t-change-governor-for-amd-pstate-at-probe.patch?h=f39")
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$_pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-tests-Split-immutable-control-into-a-test-helper.patch?h=f39"
  patch --forward --strip=1 --input="${srcdir}/0002-Allow-both-CPU-and-platform-drivers-to-be-simultaneo.patch?h=f39"
  patch --forward --strip=1 --input="${srcdir}/0003-Update-integration-test-to-be-compatible-with-pm-pro.patch?h=f39"
  patch --forward --strip=1 --input="${srcdir}/0004-Disable-loading-amd-pstate-when-the-PM-profile-is-a-.patch?h=f39"
  patch --forward --strip=1 --input="${srcdir}/0005-Don-t-change-governor-for-amd-pstate-at-probe.patch?h=f39"
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
