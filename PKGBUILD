# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=snekstudio

pkgname=snekstudio-bin
pkgver=0.1.4
pkgrel=2
pkgdesc="Open-source VTuber software using Godot Engine!"
arch=("x86_64" "aarch64")
url="https://github.com/ExpiredPopsicle/SnekStudio"
license=("GPL-3.0")
depends=() # Honestly not entirely sure what to throw in here
provides=("snekstudio")
conflicts=("snekstudio")
options=(!debug)
source=("icon.png::https://github.com/ExpiredPopsicle/SnekStudio/blob/v0.1.4/Core/UI/Images/kiri_smug.png?raw=true"
        "$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=("9bc60005961b0df54f23f3edd11a3bb9"
         "0555a65f96c0be56a0810b9af2365dd6"
         "5428dbf87276926fb84bdf88a87a78b4")
source_x86_64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-x86_64_$pkgver.tar.gz")
sha256sums_x86_64=("27266fb3e280c38fe32c382f93c07f9972feb0e93baf21c9b81df58968a2a1b0")
source_aarch64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-arm64_$pkgver.tar.gz")
sha256sums_aarch64=("810ed7f1fe5653d1f16c7d74b7f87dd576a5c7047cdbf66e2f8a7176a4544f2f")

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
