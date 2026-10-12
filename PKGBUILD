# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=wheels-of-aurelia
pkgver=1
pkgrel=1
pkgdesc='Interactive road trip visual novel set in 1978 Italy. Itch.io version.'
arch=('x86_64')
url='https://santaragione.itch.io/wheelsofaurelia'
license=('LicenseRef-unknown')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libx11'
  'lib32-libxrandr'
)
options=('!debug' '!strip')

source=(
  'file://wheelsofaurelia-linux-universal.zip'
  "${pkgname}.desktop"
)
sha512sums=(
  'a3c42e01d9796c901e6c5883f890648a58222673aa5fc3e216710101739589346bde19afa2fc3d003408869f8729817185a30614e6905248543e4a42368c28c2'
  'b26310853e124e76abc926c71955ba1766a96a41aac8b8c9a74cb5be8ff23167734d9ba9c48e8d1d0c66cd96ffeabbeb9155a88660eb96b53e60dd8a3c1b7e52'
)

package() {
  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/woa_Data/Resources/UnityPlayer.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R --preserve=mode \
    "${srcdir}"/{woa.x86,woa_Data} \
    "${pkgdir}/opt/${pkgname}/"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
