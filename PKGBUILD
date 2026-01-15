# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_pkgname="asset-ripper"
_exeName="AssetRipper.GUI.Free"

pkgname=asset-ripper-bin
pkgver=1.3.9
pkgrel=1
pkgdesc="GUI Application to work with engine assets, asset bundles, and serialized files"
arch=(x86_64 aarch64)
url="https://github.com/AssetRipper/AssetRipper"
depends=('gcc-libs' 'dbus' 'glibc' 'webkit2gtk-4.1')

source=("https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/LICENSE.md"
	"https://raw.githubusercontent.com/AssetRipper/AssetRipper/refs/tags/$pkgver/Media/Images/LogoReimagined/LogoReimaginedTransparent.png")
source_x86_64=("$_pkgname-x86_64.tar.gz::$url/releases/download/$pkgver/AssetRipper_linux_x64.zip")
source_aarch64=("$_pkgname-aarch64.tar.gz::$url/releases/download/$pkgver/AssetRipper_linux_arm64.zip")

sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('cefffb9770815e8a1b59687998492fb31522a8e842201fe8de9c9e0bf146937d')
sha256sums_aarch64=('352e85c92a41684aa9ae568bf100ab56de49e05ea12bbe4d306d37f7af10b518')

license=("GPL-3.0-only")
options=("!debug")
provides=($_pkgname)
conflicts=($_pkgname)

package() {
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"

	# keepign this just in case
	# for _file in *; do
	# 	install -Dm755 "$_file" "$pkgdir/opt/$_pkgname/$_file"
	# done

	cp "$_exeName" "$pkgdir/usr/bin/$_pkgname"
	install -D "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -D LogoReimaginedTransparent.png "$pkgdir/usr/share/icons/$_pkgname.png"

	# ln -s "/opt/$_pkgname/$_exeName" "$pkgdir/usr/bin/$_pkgname"

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=Asset Ripper
Exec=/usr/bin/$_pkgname --log=False
Icon=$_pkgname
Terminal=false
Type=Application
Comment=GUI asset ripper
Categories=Game;Development;
EOF
}
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            '223a74636902eeed55ad13a44e7292ff9f532df24c706dd8d566b33d00246757')
sha256sums_x86_64=('1393c64a0902c48c74ec3e85bc95321e253696f90ecfe3c8b845c9ae7b0fc61a')
sha256sums_aarch64=('cba4e842696a6c28de5fcb50ce38bbcacceb9236ca00384d602d9fb8f3f6db4d')
