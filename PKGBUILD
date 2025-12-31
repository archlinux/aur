# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Anton Hvornum <torxed@archlinux.org>
# Contributor: Anton Hvornum <anton@hvornum.se>
# Contributor: demostanis worlds <demostanis@protonmail.com>
# Contributor: h8d13 <hadean-eon-dev@proton.me>

pkgname=archinstall-latest
pkgver=3.0.14
pkgrel=1
pkgdesc="Just another guided/automated Arch Linux installer with a twist (latest release)"
arch=(any)
url="https://github.com/archlinux/archinstall"
license=(GPL-3.0-only)
depends=(
  'arch-install-scripts'
  'btrfs-progs'
  'coreutils'
  'cryptsetup'
  'dosfstools'
  'e2fsprogs'
  'glibc'
  'kbd'
  'libcrypt.so'
  'libxcrypt'
  'pciutils'
  'procps-ng'
  'python'
  'python-cryptography'
  'python-pydantic'
  'python-pyparted'
  'python-textual'
  'systemd'
  'util-linux'
  'xfsprogs'
  'lvm2'
  'f2fs-tools'
  'ntfs-3g'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'ruff'
)
optdepends=(
  'python-systemd: Adds journald logging'
)
provides=(archinstall)
conflicts=(archinstall python-archinstall archinstall-git)
source=(
  archinstall-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('92f81ac80779b955d6e2550edf74c17bdedc2da9c69ea50b21fce034f9fa49e0')

check() {
  cd archinstall-$pkgver
  ruff check
}

build() {
  cd archinstall-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd archinstall-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
}
