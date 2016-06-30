# Maintainer: OSO <osospeed@hotmail.com>

pkgname=hopper
pkgUrl=$(wget --user-agent="Mozilla" -O- http://www.hopperapp.com/download.html 2>&1 | grep -o -E 'href="([^"#]+)"' | grep pkg | cut -d'"' -f2 | sed 's/.* \(.*\)/\1/gi' | head -n1)
IFS=- read x pkgver pkgrel x <<< ${pkgUrl};
pkgdesc="Hopper disassembler"
arch=('x86_64' 'i686')

package() {
	tmpFolder=$(mktemp -d)
	cd ${tmpFolder}
	wget "http://www.hopperapp.com/linux/arch/hopper-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz"
	pacman -U *.xz
	rm -rf ${tmpFolder}
}