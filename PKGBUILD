#Maintainer: zayatura <zayatura@tutanota.com>
pkgname=infra-arcana
pkgver=22.0.0
pkgrel=1
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
makedepends=()
depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
conflicts=('infra-arcana-git')

install=${pkgname}.install
source=("ia_linux_x64_v$pkgver.zip::https://gitlab.com/martin-tornqvist/ia/-/jobs/artifacts/v$pkgver/download?job=build-linux"
    "icon_v$pkgver.ico::https://gitlab.com/martin-tornqvist/ia/-/raw/v$pkgver/icon/icon.ico?inline=false"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "${pkgname}.sh")
sha256sums=('776a083044ad877f2c5fca5fcf73b92f286629df73dff6ae77720b3831c0148c'
         '5c5b0b435e5effead5a700bc870aaf227536f32e736348f23956048d7c3225fd'
         '3675cbaa28ce7e9e99271914f957cdbec942799aef0f88584cd99ddd642360d2'
         'c7738445681a33b5a1ca95528c0d3a6131bd867d6ce76f3b64677cee846a83c3'
         'fc7f7ab24e2e5adc8958842b27925ad97037b82fc8e722f4aaf14573f3308c82')

package() {
  cd $srcdir/ia_linux_x64_v$pkgver
  
  #install licenses
  install -DTm644 "./LICENSE.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -DTm644 "./LICENSE-FONT-SPECIAL-ELITE.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-SPECIAL-ELITE.txt"
        install -DTm644 "./LICENSE-AUDIO.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AUDIO.txt"
        install -DTm644 "./LICENSE-FONT-DEJAVU.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-DEJAVU.txt"
        install -DTm644 "./LICENSE-FONTS.txt"\
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONTS.txt"
  #install docs
  install -DTm644 "./contact.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
  install -DTm644 "./credits.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
  install -DTm644 "./release_history.txt" \
          "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"
  # copy data
        mkdir -p "${pkgdir}/opt/${pkgname}/"
        cp -R ./audio "${pkgdir}/opt/${pkgname}/"
        cp -R ./data "${pkgdir}/opt/${pkgname}/"
        cp -R ./gfx "${pkgdir}/opt/${pkgname}/"
        cp ./manual.txt "${pkgdir}/opt/${pkgname}/"
  # copy main binary
  cp ./ia "${pkgdir}/opt/${pkgname}/"
        # this shell script is required as the compiled binary relies on
        # relative references
        install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
        #install icon
        install -Dm644 "${srcdir}/icon_v$pkgver.ico" \
          "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
        install -Dm644 "${srcdir}/${pkgname}.desktop" \
          "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
