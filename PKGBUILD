# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=snekstudio

pkgname=snekstudio-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Open-source VTuber software using Godot Engine!"
arch=("x86_64" "aarch64")
url="https://github.com/ExpiredPopsicle/SnekStudio"
license=("GPL-3.0")
depends=() # Honestly not entirely sure what to throw in here
provides=("snekstudio")
conflicts=("snekstudio")
options=(!debug)
source=("icon.png::https://github.com/ExpiredPopsicle/SnekStudio/blob/v$pkgver/Core/UI/Images/icons/256x256.png?raw=true"
        "$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=("ac27d4ded8fcf4492621f93628259786"
         "371c3f4fcd3d6c27230a70722146a25f"
         "deb87bc899bd7520413604b660ab2e72")
source_x86_64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-x86_64_$pkgver.tar.gz")
sha256sums_x86_64=("89db82fdf638898721f04c93f787f683f40ab56fccfff2539e69ee906e774aa0")
source_aarch64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-arm64_$pkgver.tar.gz")
sha256sums_aarch64=("0932ec0a72edd2cba682ee8fac09f92bc6ae032d414184f418b48806327df63e")

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
