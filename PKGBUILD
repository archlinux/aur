# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=polymath-dev
pkgver=1.4.5.6
pkgrel=2
pkgdesc='Advanced keyboard layout customization tool for Flux keyboards (dev build)'
arch=('x86_64')
url='https://fluxkeyboard.com/updates-dev/polymath/linux/deb/'
license=('custom')
makedepends=('binutils' 'tar' 'zstd' 'xz')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'desktop-file-utils' 'fontconfig' 'freetype2'
  'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnutls' 'gtk3' 'harfbuzz'
  'krb5' 'libayatana-appindicator' 'libayatana-indicator' 'libbsd' 'libdbusmenu-glib'
  'libdrm' 'libepoxy' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libpng' 'libpulse'
  'librsvg' 'libsecret' 'libva' 'libvdpau' 'libwebp' 'libx11' 'libxcb' 'libxext'
  'libxinerama' 'libxkbcommon' 'libxml2' 'libxpresent' 'libxrandr' 'libxss' 'libxv'
  'mesa' 'nettle' 'openssl' 'pango' 'systemd-libs' 'wayland' 'xz' 'zlib'
)
conflicts=('polymath')
options=('!strip' '!debug' '!lto')
source=(
  "https://fluxkeyboard.com/updates-dev/polymath/linux/deb/polymath_${pkgver}_amd64.deb"
  'udev.rules'
)
sha256sums=(
  'c1b7a0bc3dfcbae8fea7c9928b702c8f9317b5bd16b98e9e5c25fbcbe1ad146c'
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
