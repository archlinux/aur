# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=polymath
pkgver=1.4.5.8
pkgrel=1
pkgdesc='Advanced keyboard layout customization tool for Flux keyboards'
arch=('x86_64')
url='https://fluxkeyboard.com/updates/'
license=('custom')
makedepends=('binutils' 'tar' 'zstd' 'xz')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'desktop-file-utils' 'fontconfig'
  'freetype2' 'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnutls' 'gtk3'
  'harfbuzz' 'krb5' 'libayatana-appindicator' 'libayatana-indicator' 'libbsd'
  'libdbusmenu-glib' 'libdrm' 'libepoxy' 'libgcrypt' 'libglvnd' 'libgpg-error'
  'libpng' 'libpulse' 'librsvg' 'libsecret' 'libusb' 'libva' 'libvdpau'
  'libwebp' 'libx11' 'libxcb' 'libxext' 'libxinerama' 'libxkbcommon'
  'libxml2-legacy' 'libxpresent' 'libxrandr' 'libxss' 'libxv' 'mesa' 'nettle3'
  'openssl' 'pango' 'systemd-libs' 'wayland' 'xz' 'zlib'
)
conflicts=('polymath-dev')
options=('!strip' '!debug' '!lto')
source=(
  "https://fluxkeyboard.com/updates/polymath/linux/deb/polymath_${pkgver}_amd64.deb"
  'udev.rules'
)
sha256sums=(
  '829e30c73354225e699d8f0b709a764e5dd95e8424ecf7d55e4d42b6edc6db08'
  'SKIP'
)

build() {
  cd "${srcdir}"
  rm -rf data && mkdir data

  tar -C data -xf data.tar*

  rm -rf data/etc/polkit-1
  chmod -R g-w data
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/data/opt/polymath" "${pkgdir}/opt/"
  cp -r "${srcdir}/data/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/udev.rules" "${pkgdir}/usr/lib/udev/rules.d/95-polymath.rules"
}

# vim:set ts=2 sw=2 et:
