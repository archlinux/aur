# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=snekstudio
pkgname=snekstudio-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Open-source VTuber software using Godot Engine!"
arch=("x86_64" "aarch64")
url="https://github.com/ExpiredPopsicle/SnekStudio"
license=("GPL-3.0")
depends=() # Honestly not entirely sure what to throw in here.
provides=("snekstudio")
conflicts=("snekstudio")
options=(!debug)
source=("https://raw.githubusercontent.com/ExpiredPopsicle/SnekStudio/refs/tags/v$pkgver/Core/UI/Images/kiri_smug.png"
        "$_pkgname.desktop")
md5sums=("9bc60005961b0df54f23f3edd11a3bb9"
         "a4eb3afd68dcdf5aa63ff5122d295b53")
source_x86_64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-x86_64_0.1.1.tar.gz")
md5sums_x86_64=("09bca36167000c2075c4b51d6604f18f")
source_aarch64=("https://github.com/ExpiredPopsicle/SnekStudio/releases/download/v$pkgver/SnekStudio_Linux-arm64_0.1.1.tar.gz")
md5sums_aarch64=("4bcf79a7a8d510771660fec59e658fde")

# Unpacked folder name differs depending on architecture, so create a symlink
prepare_x86_64() { ln -s SnekStudio_Linux-x86_64 "$_pkgname"; }
prepare_aarch64() { ln -s SnekStudio_Linux-arm64 "$_pkgname"; }

package() {
	# Copy application icon, .desktop and license files
	install -Dm644 kiri_smug.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	install -Dm644 "$_pkgname"/LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE.txt
	# Copy all other application files (-L to follow previously created symlink)
	cp -rdpL --no-preserve=ownership "$_pkgname" "$pkgdir"/usr/share/"$_pkgname"
}
