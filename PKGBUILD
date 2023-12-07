# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Funami

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=jetbrains-fleet
pkgver=1.28.106
pkgrel=1
pkgdesc="Next-generation IDE by JetBrains"
arch=('x86_64' 'aarch64')
url="https://www.jetbrains.com/fleet/"
license=('custom:jetbrains')
options=('!strip')
source=("${pkgname}.desktop" 'LICENSE')
source_x86_64=("${pkgname}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/fleet/installers/linux_x64/Fleet-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/fleet/installers/linux_${arch[1]}/Fleet-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('af62a597c595edc5b4a8ea3f80ab0a18ea953bfc2d4feaf30e41c6e0dd23d426'
            'db26ca1fd026fbacfeb87f4bad42d78b3512bb733ce1c566bdd5b751e77d7bb3')
sha256sums_x86_64=('b1afa74147733fee98653959800f3af8ba42cf929a0c639c0ad666a51f3c39aa')
sha256sums_aarch64=('8736ddb3d8a0b5d1fe9b53606c1c7a4e40996f472184cf916f73ca2c1685482b')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cp -a "Fleet/." "${pkgdir}/opt/${pkgname}"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/Fleet" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/lib/Fleet.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
