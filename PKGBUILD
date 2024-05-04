# Maintainer: Dreemurrs Embedded Labs

pkgname=archarm-mobile-fde-installer-git
_pkgname=${pkgname%-git}
pkgver=r3.7ea234b
pkgrel=1
pkgdesc='Script to setup Full-Ddisk-Encryption on Arch Linux ARM for PinePhone and PineTab'
arch=('any')
url='https://github.com/dreemurrs-embedded/archarm-mobile-fde-installer'
license=('custom:none')
depends=(
  'git'
  'openssl'
)
optdepends=(
  'gnupg: config import/export support'
)
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("archarm-mobile-fde-installer=${pkgver}")
depends=(
  'cryptsetup'
  'curl'
  'e2fsprogs'
  'f2fs-tools'
  'parted'
  'squashfs-tools'
  'sudo'
  'tar'
  'util-linux'
  'wget'
  'zstd'
)

pkgver() {
  cd "${srcdir}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -m 755 -D installer.sh "${pkgdir}/usr/bin/archarm-mobile-fde-installer"
}
