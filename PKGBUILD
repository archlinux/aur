# Maintainer: Matheus Vilano <aur.negotiate177@passinbox.com>

_appname="Bionic"
_srcname="lmbionic"
_binname="lm-bionic"
_iconame="bionic"
_lnkname="ai-elementlabs.lmbionic"

pkgname=lmbionic-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="LM Studio Bionic - Agent for open models, natively local"
arch=("x86_64" "aarch64")
url="https://lmstudio.ai"
license=("EULA")
depends=("fuse-common" "zlib" "hicolor-icon-theme" "gtk3" "nss" "libxcrypt-compat")
options=("!strip")
install="${_srcname}.install"
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${_srcname}.png"
        "${_srcname}.desktop")
source_x86_64=("${_appname}.AppImage::https://bionic-installers.lmstudio.ai/linux/x64/1.2.0-2/Bionic-1.2.0-2-x64.AppImage")
source_aarch64=("${_appname}.AppImage::https://bionic-installers.lmstudio.ai/linux/arm64/1.2.0-2/Bionic-1.2.0-2-arm64.AppImage")
sha256sums=("099f025c7e7ef8f53e4741e3438f83b05b46b6e6a8e7677a09295467edfb3bb1"
            "SKIP")
sha256sums_x86_64=("08e9e9984edaabddc5c29a6226646c3e823eaa26d7213dbfe1d0105e19e3830d")
sha256sums_aarch64=("914c7160b6204dd31cbb3955a6ab5eddc519df442fb92dba797343133d9bf658")

prepare()
{
  chmod +x "${srcdir}/${_appname}.AppImage"
}

package()
{
  # Create installation directory
  install -dm755 "$pkgdir/opt/${pkgname}"

  # Install AppImage
  install -Dm755 "${srcdir}/${_appname}.AppImage" "$pkgdir/opt/${pkgname}/${_appname}.AppImage"

  # Install static icon
  install -Dm644 "${srcdir}/${_srcname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_iconame}.png"
  install -Dm644 "${srcdir}/${_srcname}.png" "$pkgdir/usr/share/pixmaps/${_iconame}.png"

  # Desktop entry
  install -Dm644 "$srcdir/${_srcname}.desktop" "$pkgdir/usr/share/applications/${_lnkname}.desktop"

  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/${pkgname}/${_appname}.AppImage "$pkgdir/usr/bin/${_binname}"
}
