# Maintainer: Eason <yelanxin@gmail.com>
#
# Binary package for OxiTide. The application is proprietary freeware
# (source is not public), so this repackages the x86_64 Arch build
# published on the release hub.
pkgname=oxitide-bin
_pkgname=oxitide
# Upstream tags are v0.1-betaN; pacman forbids '-' in pkgver.
pkgver=0.2.3
_tag="v0.2.3"
pkgrel=1
pkgdesc="High-resolution TIDAL and local music player for Linux, written in Rust. Bit-perfect USB output."
arch=('x86_64')
url="https://github.com/yelanxin/OxiTide"
license=('LicenseRef-Proprietary')
depends=(
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
  'gst-plugins-good'
  'pipewire'
  'libpulse'
  'alsa-lib'
  'libusb'
  'openssl'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::${url}/releases/download/${_tag}/${_pkgname}-${pkgver}-1-x86_64_archlinux.pkg.tar.zst")
sha256sums=('e7cac10dad3eed16f74f5092df5811bfd3f75707ef4683d089e022b2bae14a37')
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

package() {
  # Unpack only the payload; the upstream package's own .PKGINFO /
  # .INSTALL / .MTREE must not leak into $pkgdir.
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude '.PKGINFO' --exclude '.INSTALL' --exclude '.MTREE' --exclude '.BUILDINFO'
}
