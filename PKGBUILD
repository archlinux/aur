# Maintainer: pokemonpasta
_bin=TF2DecalVault_linux64
_pkgname=tf2decalvault
pkgname=$_pkgname-bin
pkgdesc="A user interface to upload and download UGC images for TF2's decal system."
pkgver=1.1
pkgrel=1

arch=(x86_64)
url="https://github.com/arclight-servers/TF2-Decal-Vault"
license=("MIT")

options=(!strip !debug)

source=(
	"$pkgname-$pkgver.zip::https://github.com/arclight-servers/TF2-Decal-Vault/releases/download/$pkgver/TF2DecalVault_linux64.zip"
	"$_pkgname.desktop"
	"$_pkgname.svg::https://raw.githubusercontent.com/arclight-servers/TF2-Decal-Vault/$pkgver/icon.svg"
)
sha256sums=('235d4e76ed3b025916c46aa8ba2011e7a323948729aa4dc12f09f48b1e4114a7'
            '88fa576e334ff68fb20449b2c8ec5d0d7b13dc7d7494441d7306794d8f6bbe85'
            '6c80384360a5b269d1054bfb27241258154e2cc8167c522016fdc1820e84e0f8')

package() {
	cd "$srcdir"
	install -Dm755 -t "$pkgdir/usr/lib/$_pkgname" {libgodotsteam.linux.template_release.x86_64.so,libsteam_api.so,$_bin,$_bin.sh}
	
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/$_pkgname/$_bin.sh" "$pkgdir/usr/bin/$_pkgname"
	
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
