# shellcheck disable=SC2034,SC2148,SC2154

# Maintainer: Mylloon <aur@mylloon.fr>

_pkgname=obs-plugin-shadertastic
pkgname="${_pkgname}"-bin
pkgdesc="An OBS plugin to add amazing effects for your stream"
pkgver=1.2.0
pkgrel=1

arch=("x86_64")
url="https://github.com/xurei/shadertastic"
license=('GPL-2.0')

depends=('obs-studio')

provides=("${_pkgname}=${pkgver}")

source=("https://github.com/xurei/shadertastic/releases/download/$pkgver/shadertastic-$pkgver-x86_64-linux-gnu.deb")
sha256sums=('ee131d96294d5be3e37cc27bbbb7d2d42ff5b766144106dedf0d7085f547e850')

options=(!debug)

package() {
  bsdtar -xf "${srcdir}"/data.tar.gz -C "${pkgdir}"/
  cd "${pkgdir}"/usr/lib/ || exit
  mv x86_64-linux-gnu/obs-plugins .
  rm -r x86_64-linux-gnu
  chown root:root -vR "${pkgdir}/"
}
