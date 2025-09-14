# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=snekstudio

pkgname=snekstudio-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Open-source VTuber software using Godot Engine!"
arch=("x86_64" "aarch64")
url="https://github.com/ExpiredPopsicle/SnekStudio"
license=("GPL-3.0")
depends=() # Honestly not entirely sure what to throw in here
provides=("snekstudio")
conflicts=("snekstudio")
options=(!debug)
source=("icon.png::https://github.com/ExpiredPopsicle/SnekStudio/blob/v$pkgver/Core/UI/Images/kiri_smug.png?raw=true"
        "$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=("9bc60005961b0df54f23f3edd11a3bb9"
         "371c3f4fcd3d6c27230a70722146a25f"
         "5428dbf87276926fb84bdf88a87a78b4")
source_x86_64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-x86_64_$pkgver.tar.gz")
sha256sums_x86_64=("b486a9b15b86c6384e278baf50f0ded14c5854f6fc0dd72c83d56e0a0f2aaca1")
source_aarch64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-arm64_$pkgver.tar.gz")
sha256sums_aarch64=("7c7cb17e043552603282b8eadea9fa70c20224fe7fa359b80207d14d355599c0")

prepare() {
	# Unpacked folder name differs depending on architecture
	if [ "$arch" = "x86_64" ]; then mv SnekStudio_Linux-x86_64 "$_pkgname"; fi
	if [ "$arch" = "aarch64" ]; then mv SnekStudio_Linux-arm64 "$_pkgname"; fi
}

package() {
	# Copy application icon, launcher, .desktop and license files
	install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm644 "$_pkgname"/LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE.txt
	# Copy all other application files
	cp -rdp --no-preserve=ownership "$_pkgname" "$pkgdir"/usr/share/"$_pkgname"
}
