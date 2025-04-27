# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_pkgname="asset-ripper"
_exeName="AssetRipper.GUI.Free"

pkgname=asset-ripper-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="GUI Application to work with engine assets, asset bundles, and serialized files"
arch=(x86_64 aarch64)
url="https://github.com/AssetRipper/AssetRipper"
depends=('gcc-libs' 'dbus' 'glibc' 'qt-sudo' 'webkit2gtk-4.1')

source=("https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/LICENSE.md"
        "https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/Media/Images/LogoReimagined/LogoReimaginedTransparent.png")
source_x86_64=("$_pkgname-x86_64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_x64.zip")
source_aarch64=("$_pkgname-aarch64.tar.gz::https://github.com/AssetRipper/AssetRipper/releases/download/$pkgver/AssetRipper_linux_arm64.zip")

sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            '223a74636902eeed55ad13a44e7292ff9f532df24c706dd8d566b33d00246757')
sha256sums_x86_64=('2308676ce09009b9a3ab467cfedfe361c8eb7932066881f391319798ff8aeff2')
sha256sums_aarch64=('2975f46f86b283d57179847231de3a4ab1b31b77b3b911fa8276ced93f6ff16b')

license=("GPL-3.0-only")
options=("!debug")

package() {
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/applications/"

  _install_file=("$_exeName" "crunch.dll" "crunchunity.dll" "libcapstone.so" "libTexture2DDecoderNative.so" "Photino.Native.so")
  for _file in ${_install_file[@]}; do
    install -Dm755 "$_file" "$pkgdir/opt/$_pkgname/$_file"
  done

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -D LogoReimaginedTransparent.png "$pkgdir/usr/share/icons/$_pkgname.png"

  ln -s "/opt/$_pkgname/$_exeName" "$pkgdir/usr/bin/$_pkgname"

  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Asset Ripper
Exec=qt-sudo $_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=GUI asset ripper
Categories=Game;Development;
EOF
}

