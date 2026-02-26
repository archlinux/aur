# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=polymath
pkgver=1.4.0.7
pkgrel=4
pkgdesc='Advanced keyboard layout customization tool for Flux keyboards'
arch=('x86_64')
url='https://fluxkeyboard.com/updates/'
license=('custom')
makedepends=('binutils' 'tar' 'zstd')
depends=('mpv')
options=('!strip' '!debug' '!lto')
source=("polymath.deb::https://fluxkeyboard.com/updates/polymath/linux/deb/polymath_${pkgver}_amd64.deb")
sha256sums=('1182c14ddf6bd2cdc1c66e06cbcc1b08d4b4772b972c8d63b7aada4b3acfff4d')

build() {
  cd "${srcdir}"
  rm -rf deb data && mkdir deb data

  ar --output=deb x polymath.deb
  tar -C data -xf deb/data.tar.zst

  rm -rf data/etc/polkit-1
  chmod -R g-w data
}

package() {
  cp -r "${srcdir}/data/"* "${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
