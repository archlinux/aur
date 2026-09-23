# Maintainer: nuggocto <aur@sshmoi.com>

pkgname=suzumushi-bin
pkgver=1.1.6
pkgrel=1
pkgdesc='A calm, fully local terminal audio player for Linux'
arch=('x86_64')
url='https://github.com/nuggocto/suzumushi'
license=('Apache-2.0')
depends=('alsa-lib' 'dbus' 'glibc' 'libgcc' 'libpipewire')
provides=("suzumushi=$pkgver")
conflicts=('suzumushi')
options=('!debug')
_upstream_version='1.1.6'
_target="${CARCH}-unknown-linux-gnu"
_archive="suzumushi-v${_upstream_version}-${_target}"
source_x86_64=("${_archive}.tar.xz::https://github.com/nuggocto/suzumushi/releases/download/v${_upstream_version}/${_archive}.tar.xz")
sha256sums_x86_64=('88f59ccf9699c750fef57b8e661ebbad483f97fd4f4b7b2f021dd5af61f350e7')

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
