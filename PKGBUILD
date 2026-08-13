# Maintainer: nuggocto <aur@sshmoi.com>

pkgname=suzumushi-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A calm, fully local terminal audio player for Linux'
arch=('x86_64')
url='https://github.com/nuggocto/suzumushi'
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("suzumushi=$pkgver")
conflicts=('suzumushi')
options=('!debug')
_upstream_version='1.0.2'
_target="${CARCH}-unknown-linux-gnu"
_archive="suzumushi-v${_upstream_version}-${_target}"
source_x86_64=("${_archive}.tar.xz::https://github.com/nuggocto/suzumushi/releases/download/v${_upstream_version}/${_archive}.tar.xz")
sha256sums_x86_64=('adf1dc2a35258a4004c4a020cbbd7ca142025a7e0e0ce4cbe3c19bfa19a59915')

package() {
  install -Dm755 "${_archive}/suzumushi" "$pkgdir/usr/bin/suzumushi"
  if [[ ! -L "${_archive}/suzu" || "$(readlink "${_archive}/suzu")" != suzumushi ]]; then
    printf '%s\n' 'upstream suzu symlink is not relative to suzumushi' >&2
    return 1
  fi
  ln -s suzumushi "$pkgdir/usr/bin/suzu"
  install -Dm644 "${_archive}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "${_archive}/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 "${_archive}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
