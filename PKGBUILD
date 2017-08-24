## Maintainer: realasking
pkgname=fcitx-fbterm-git
pkgver=20110825
pkgrel=1
pkgdesc='add fbterm support to fcitx'
arch=(x86_64 i686)
url='https://github.com/fcitx/fcitx-fbterm'
license=('GPLv2')
depends=('fbterm-git' 'fcitx')
provides=('fcitx-fbterm')
source=()
md5sums=()
install="${pkgname}.install"

_proj=https://github.com/fcitx/fcitx-fbterm.git
_name=fcitx-fbterm

build() {
	cd "$srcdir" 
	msg "Starting Git..."
	if [[ -d "$_proj" ]]; then
	    cd "$_proj" 
	    git pull origin
	else
	    git clone "$_proj" "$_name"
	fi
	msg "Project synchronization Finished."
	msg "Starting build..."
	
	cd "$_name"
	mkdir build 
	cd build 
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_name/build"
	make DESTDIR="${pkgdir}" install 
}
