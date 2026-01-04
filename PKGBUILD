# Maintainer: Akash Sil <akashsil420@duck.com>
pkgname='malvoid-analysis'
pkgver=0.1.0
pkgrel=1
url='https://github.com/Akash420-oss/MalVoid'
pkgdesc="Malvoid is a lightweight static malware analysis and reverse engineering tool for inspecting raw binaries, understanding file internals, and safely analyzing suspicious artifacts without execution."
arch=('x86_64')
license=('MIT')
depends=('git' 'python' 'sudo' 'gcc' 'make')
makedepends=('git')
source=($pkgname::git+https://github.com/Akash420-oss/MalVoid.git)
md5sums=('SKIP')
prepare(){
	if [ -d "/usr/include/malvoid_headers" ];then
	echo -e "\033[1;38;5;196m[ BLOCKED ]\033[0m \033[38;5;51mArtifact collision detected!\033[0m"
        echo -e "\033[38;5;220m          Delete previous build and retry.\033[0m"
        exit 1
	fi
	rm -f malvoid_banner.png malvoid_output.png
}
build(){
	cd $pkgname
	make build
}
package(){
	cd $pkgname
	install -Dm 755 ./mal_void "$pkgdir/usr/bin/mal_void"
	install -Dm 755 ./malvoid "$pkgdir/usr/bin/malvoid"
	install -Dm 755 malvoid.desktop "$pkgdir/usr/share/applications/malvoid.desktop"
	install -Dm 644 malvoid_icon.png "$pkgdir/usr/share/pixmaps/malvoid_icon.png"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for h in malvoid_headers/*.h;do
		install -Dm 644 "$h" "$pkgdir/usr/include/$h"
	done
}
