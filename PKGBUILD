# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Funami

pkgname=jetbrains-fleet
pkgver=1.40.86
pkgrel=1
pkgdesc="JetBrains IDE for any language"
arch=('x86_64' 'aarch64')
url="https://www.jetbrains.com/fleet/"
license=('custom:jetbrains')
options=('!strip')
source=("${pkgname}.desktop" 'LICENSE')
source_x86_64=("${pkgname}-${pkgver}-${arch[0]}.tar.gz::https://download-cdn.jetbrains.com/fleet/installers/linux_x64/Fleet-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${arch[1]}.tar.gz::https://download-cdn.jetbrains.com/fleet/installers/linux_${arch[1]}/Fleet-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('cd955f6a93108b2438e6d8ff0434dae97c076f2201b64783338bbdad06d047fb'
            'db26ca1fd026fbacfeb87f4bad42d78b3512bb733ce1c566bdd5b751e77d7bb3')
sha256sums_x86_64=('e76615a20a5d872c7077468ed153a4e771d1cb18815d774230a0c9300c95bf8e')
sha256sums_aarch64=('050f02d58feac9564eae4bd10a91a0cc44bbf85550beaa83524ab0e8dd66bdc3')

package() {
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cp -a "Fleet/." "${pkgdir}/opt/${pkgname}"
  chmod -R 775 "${pkgdir}/opt/${pkgname}/lib/app/code-cache"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/Fleet" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/lib/Fleet.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
