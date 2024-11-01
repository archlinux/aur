# Maintainer: Akash Sil <akashsil420@duck.com>
pkgname='dare-devil'
pkgver=0.1.1
pkgrel=1
pkgdesc="It's a hellish game and going to be wickedly fun and challenging.Full of thrilling twists and turns..."
url='https://github.com/Akash420-oss/Dare-Devil'
arch=('x86_64')
license=('MIT')
depends=('git' 'gcc' 'iptables' 'glibc')
checkdepends=('git' 'gcc' 'iptables' 'glibc')
makedepends=('git' 'gcc' 'iptables' 'glibc')
source=($pkgname::git+https://github.com/Akash420-oss/Dare-Devil.git)
md5sums=('SKIP')
prepare(){
	if [ -d "/usr/share/$pkgname" ]
	then 
		sudo rm -rf /usr/share/$pkgname
		sudo mkdir /usr/share/$pkgname
	else
	        sudo mkdir /usr/share/$pkgname
	fi
	cd $pkgname
	rm -f install.sh uninstall.sh 'devil_&angel.gif'
	sudo cp custom_fun.h create_soul_data.h devil_art.h system_crash.h /usr/include
}	
build(){
cd $pkgname
gcc -o dare_devil dare_devil.c -w
rm -f dare_devil.c
sudo rm -f /usr/include/custom_fun.h /usr/include/system_crash.h /usr/include/create_soul_data.h /usr/include/devil_art.h
}
package(){
	cd $pkgname
	chmod a+x dare_devil
	install -Dm 755 ./dare_devil "$pkgdir/usr/bin/dare_devil"
	install -Dm 644 custom_fun.h "$pkgdir/usr/include/custom_fun.h"
	install -Dm 644 create_soul_data.h "$pkgdir/usr/include/create_soul_data.h"
	install -Dm 644 devil_art.h "$pkgdir/usr/include/devil_art.h"
	install -Dm 644 system_crash.h "$pkgdir/usr/include/system_crash.h"
	install -Dm 755 dare-devil.desktop "$pkgdir/usr/share/applications/dare-devil.desktop"
	install -Dm 755 Dare_Devil.png "$pkgdir/usr/share/pixmaps/Dare_Devil.png"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
