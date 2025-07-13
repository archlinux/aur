# Maintainer: kdh8219 <kdh8219@monamo.dev>

pkgname=rapidraw-bin
pkgdesc="A beautiful, non-destructive, and GPU-accelerated RAW image editor built with performance in mind."
pkgver=1.2.45
pkgrel=1
arch=('x86_64')
url=https://github.com/CyberTimon/RapidRAW
license=('AGPL-3.0-or-later')
provides=("rapidraw")
depends=("onnxruntime")


_prgname="RapidRAW"
_debfile="${_prgname}_v${pkgver}_ubuntu_amd64.deb"
source=(
    "https://github.com/CyberTimon/RapidRAW/releases/download/v${pkgver}/${_debfile}"
)
sha256sums=(
    "c0ac41f079fd6a9a22e674a3578fa2ba5221f08980c08f5f7e149ae3041f3fba"
)

prepare() {
  ar x ${_debfile}
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz
}

package() {
  cd "$srcdir"

  # Install binaries
  install -Dm755 -t "$pkgdir/usr/bin/" "usr/bin/${_prgname}"

  # Install desktop file from deb
  install -Dm644 -t "$pkgdir/usr/share/applications/" "usr/share/applications/${_prgname}.desktop"

  # Install desktop icons from deb
  for icon_size in 32x32 128x128 256x256@2; do
    icons_dir="usr/share/icons/hicolor/${icon_size}/apps"
    install -Dm644 -t "$pkgdir/${icons_dir}/" "${icons_dir}/${_prgname}.png"
  done
}
