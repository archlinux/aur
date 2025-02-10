# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_sourceName="asset-ripper"
_exeName="AssetRipper.GUI.Free"

pkgname=asset-ripper-bin
pkgver=1.1.12
pkgrel=1
pkgdesc="GUI Application to work with engine assets, asset bundles, and serialized files"
arch=(x86_64 aarch64)
url="https://github.com/AssetRipper/AssetRipper"
depends=('gcc-libs' 'dbus' 'glibc')

source=("https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/LICENSE.md"
        "https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/Media/Images/LogoReimagined/LogoReimaginedTransparent.png")
source_x86_64=("$_sourceName-x86_64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_x64.zip")
source_aarch64=("$_sourceName-aarch64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_arm64.zip")

sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            '223a74636902eeed55ad13a44e7292ff9f532df24c706dd8d566b33d00246757')
sha256sums_x86_64=('4216b3ea77677047ecdd15a55614c78f83cb7bc68baaeafe38e7e7db826f34a4')
sha256sums_aarch64=('3e80cb13fcb7651e4e78b59caf7ab305edef714c967a448446b81c01e6ea7e3e')

license=("GPL-3.0-only")
options=("!debug")

package() {
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/applications/"

  install -Dm755 "$_exeName" "$pkgdir/opt/$_sourceName/$_exeName"
  install -Dm755 "crunch.dll" "$pkgdir/opt/$_sourceName/crunch.dll"
  install -Dm755 "crunchunity.dll" "$pkgdir/opt/$_sourceName/crunchunity.dll"
  install -Dm755 "libcapstone.so" "$pkgdir/opt/$_sourceName/libcapstone.so"
  install -Dm755 "libnfd.so" "$pkgdir/opt/$_sourceName/libnfd.so"
  install -Dm755 "libTexture2DDecoderNative.so" "$pkgdir/opt/$_sourceName/libTexture2DDecoderNative.so"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -D LogoReimaginedTransparent.png "$pkgdir/usr/share/icons/$_sourceName.png"

  ln -s "/opt/$_sourceName/$_exeName" "$pkgdir/usr/bin/$_sourceName"

  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_sourceName.desktop << EOF
[Desktop Entry]
Name=Asset Ripper
Exec=$_sourceName
Icon=$_sourceName
Terminal=false
Type=Application
Comment=GUI asset ripper
Categories=Game;Development;
EOF
}

