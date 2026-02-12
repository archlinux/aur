# Maintainer: vogan <voganwong@hotmail.com>

pkgname=cherry-studio-bin
_pkgname=cherry-studio
pkgver=1.7.18
pkgrel=1
pkgdesc="🍒 Cherry Studio is a desktop client that supports for multiple LLM providers "
arch=('x86_64' 'aarch64')
url="https://github.com/cherryHQ/cherry-studio"
license=('AGPL-3.0')
options=('!strip' '!debug')
depends=('fuse2')
case "$CARCH" in
  x86_64)
    _appimage_arch='x86_64'
    ;;
  aarch64)
    _appimage_arch='arm64'
    ;;
esac

source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Cherry-Studio-${pkgver}-${_appimage_arch}.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
  "${pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.AppImage")
conflicts=("$_pkgname")

package() {
  cd "$srcdir"

  # Create directories
  install -dm755 "$pkgdir/usr/bin/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Install AppImage
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
  # Install icon
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  # Install desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  # Install cherry-studio-bin.sh
  install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
case "$CARCH" in
  x86_64)
    _sha256sum='ed3e14d44dd86605aca3a17c50d48089042c1ba98007a4bbdb80b3b23eb0acd4'
    ;;
  aarch64)
    _sha256sum='8e76fafab4a1bd886f38b9655f172ad381b06eb6a767c1010717f9279b4dd028'
    ;;
esac

sha256sums=("$_sha256sum"
            'fd0b11ca782c9c0de6dbf34143b7f14560b4a7020e316c58e9a5e1115551c7ee'
            '597463003798254ab97505e2374485e55262152483f717f3169da3444de60f94'
            '6aed5e7ca95679b2545540241dc9e6b055da1dfde696006a1712f90cfbfaec92')
