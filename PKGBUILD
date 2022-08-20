_pkg=mfosu
pkgname=$_pkg-bin
pkgver=2022.528.0
pkgrel=4
pkgdesc="A fork of osu!lazer."
arch=(x86_64)
url="https://github.com/MATRIX-feather/osu"
license=(
  "MIT"
  "custom:CC-BY-NC 4.0"
)
depends=(
  zlib
  libgl
  fuse2
  osu-mime
)
provides=(
  osu-lazer
  mf-osu
  $_pkg
)
source=(
  "https://dl.hiosu.com/本地下载点① - 电信网络推荐/Linux版($pkgver)/$_pkg.appimage"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "$_pkg.desktop"
  "$_pkg"
)
sha256sums=(
  'fe8f26b11443a0f0e6dc9e6c10d32d9c3c5cc3f2e825e970f4ebfe4f7994ae37'
  '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
  '97eb363bff09b570ecb9c3ff1fc9a72bcc70b21622b164ef730030f83372ed54'
  '0b3c5c14ed0e22f8e8e7996602fc0120517d551380f4851a075f3c181f89c46c'
)
prepare() {
  chmod +x $_pkg.appimage
  ./$_pkg.appimage --appimage-extract >/dev/null
}
package() {
  # Install launch script
  install -Dm755 -t "$pkgdir/usr/bin" $_pkg

  # Install desktop and license file
  local _share=/usr/share/
  install -Dm644 -t "$pkgdir/$_share/applications" $_pkg.desktop
  install -Dm644 -t "$pkgdir/$_share/licenses/$_pkg" LICENCE.md

  # Install main file
  cd squashfs-root
  cp -r opt $pkgdir
  install -Dm644 'osu!.png' "$pkgdir/$_share/pixmaps/$_pkg.png"
}
