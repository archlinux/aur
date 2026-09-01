# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=polymath
pkgver=1.4.3.1
pkgrel=1
pkgdesc='Advanced keyboard layout customization tool for Flux keyboards'
arch=('x86_64')
url='https://fluxkeyboard.com/updates/'
license=('custom')
makedepends=('binutils' 'tar' 'zstd')
depends=('glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'desktop-file-utils' 'libsecret')
options=('!strip' '!debug' '!lto')
source=(
  "https://fluxkeyboard.com/updates/polymath/linux/deb/polymath_${pkgver}_amd64.deb"
  'udev.rules'
)
sha256sums=(
  '702806daac159a416c2212ddc6232d4c2ba5e03876cdafb3a6da0a858289ddf3'
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
