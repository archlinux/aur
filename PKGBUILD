# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Funami

pkgname=jetbrains-fleet
pkgver=1.35.110
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
sha256sums_x86_64=('2606f34a7014774ce4d90a2fd703bb66f2f446caac9bb0108ef5a2b936f98292')
sha256sums_aarch64=('bbcf73aa291f5db3b4856d861f6bae56862aa2dc81c70719a9d06e4102718bd1')

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
