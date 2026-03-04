# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=polymath
pkgver=1.4.0.7
pkgrel=9
pkgdesc='Advanced keyboard layout customization tool for Flux keyboards'
arch=('x86_64')
url='https://fluxkeyboard.com/updates/'
license=('custom')
makedepends=('binutils' 'tar' 'zstd')
depends=('mpv' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'desktop-file-utils')
options=('!strip' '!debug' '!lto')
source=(
  "https://fluxkeyboard.com/updates/polymath/linux/deb/polymath_${pkgver}_amd64.deb"
  'udev.rules'
)
sha256sums=(
  '1182c14ddf6bd2cdc1c66e06cbcc1b08d4b4772b972c8d63b7aada4b3acfff4d'
  'SKIP'
)

build() {
  cd "${srcdir}"
  rm -rf data && mkdir data

  tar -C data -xf data.tar.zst

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
