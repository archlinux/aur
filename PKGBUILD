# Maintainer: Soymadip <soumadip@zohomail.in>

pkgname=myctl
pkgdesc="A powerful CLI to control your Linux Desktop"
pkgver=1.8.2
pkgrel=1
arch=('any')
url="https://github.com/mydehq/${pkgname}"
license=('GPL3')
sha256sums=('SKIP')

depends=(
  'bash'
  'gawk'
  'sed'
  'grep'
  'rofi'
  'wob'
  'wireplumber'
)

source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {

  #shellcheck disable=SC2164,SC2154
  cd "${srcdir}" || exit 1

  msg2 "Packaging binaries..."
  for binary in bin/*; do
    #shellcheck disable=SC2154
    install -Dm755 "$binary" "${pkgdir}/usr/bin/$(basename "$binary")"
  done


  msg2 "Packaging libraries..."
  for libfile in lib/*; do
      install -Dm644 "$libfile" "${pkgdir}/usr/lib/${pkgname}/$(basename "$libfile")"
  done

  msg2 "Packaging src files..."
  install -dm755 "${pkgdir}/usr/src/${pkgname}"
  cp -a --no-preserve=ownership src/* "${pkgdir}/usr/src/${pkgname}/"

  msg2 "Packaging icons..."
  install -Dm644 "icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 "icons/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  msg2 "Packaging completed."

}
