# Maintainer: rzhli <tayuebuliuhen@gmail.com>

pkgname=compute42-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Compute42 IDE for Julia"
arch=('x86_64')
url="https://github.com/elan8/compute42"
license=('MIT')

depends=(
  'gtk3'
  'libnotify'
  'webkit2gtk'                  # tauri 常见依赖
  'libayatana-appindicator'     # tray / indicator
)

provides=('compute42')
conflicts=('compute42')
options=('!strip')

source=("Compute42_${pkgver}_amd64.deb::https://github.com/elan8/compute42/releases/download/v${pkgver}/Compute42_${pkgver}_amd64.deb")

sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  rm -rf deb_extract
  mkdir -p deb_extract

  # 解 deb
  bsdtar -xf "Compute42_${pkgver}_amd64.deb" -C deb_extract

  # 解 data.tar.*
  mkdir -p deb_extract/data
  bsdtar -xf deb_extract/data.tar.* -C deb_extract/data
}

package() {
  cd "$srcdir/deb_extract/data"

  [[ -d usr ]] && cp -a usr "$pkgdir/"
  [[ -d opt ]] && cp -a opt "$pkgdir/"
}
