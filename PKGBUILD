# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_pkgname="asset-ripper"
_exeName="AssetRipper.GUI.Free"

pkgname=asset-ripper-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="GUI Application to work with engine assets, asset bundles, and serialized files"
arch=(x86_64 aarch64)
url="https://github.com/AssetRipper/AssetRipper"
depends=('gcc-libs' 'dbus' 'glibc')

source=("https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/LICENSE.md"
        "https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/Media/Images/LogoReimagined/LogoReimaginedTransparent.png")
source_x86_64=("$_pkgname-x86_64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_x64.zip")
source_aarch64=("$_pkgname-aarch64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_arm64.zip")

sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('7267d897668ba24513d5366dbbfce3b52413021562e4a6a7b5691e60be4fa387')
sha256sums_aarch64=('025fb2015f30fbfb8eb85691ea6483e38b1806209825e3a7f32c530d07e9761a')

license=("GPL-3.0-only")
options=("!debug")

package() {
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/applications/"

  install -Dm755 "$_exeName" "$pkgdir/opt/$_pkgname/$_exeName"
  install -Dm755 "crunch.dll" "$pkgdir/opt/$_pkgname/crunch.dll"
  install -Dm755 "crunchunity.dll" "$pkgdir/opt/$_pkgname/crunchunity.dll"
  install -Dm755 "libcapstone.so" "$pkgdir/opt/$_pkgname/libcapstone.so"
  install -Dm755 "libTexture2DDecoderNative.so" "$pkgdir/opt/$_pkgname/libTexture2DDecoderNative.so"
  install -Dm755 "Photino.Native.so" "$pkgdir/opt/$_pkgname/Photino.Native.so"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -D LogoReimaginedTransparent.png "$pkgdir/usr/share/icons/$_pkgname.png"

  ln -s "/opt/$_pkgname/$_exeName" "$pkgdir/usr/bin/$_pkgname"

  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Asset Ripper
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=GUI asset ripper
Categories=Game;Development;
EOF
}

