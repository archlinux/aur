# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-fix-gui-git
pkgver=r278.eba0d7f
pkgrel=2
pkgdesc='A GUI electron app for the deemix library. Download music from deezer.'
url=https://gitlab.com/deeplydrumming/DeemixFix
license=("GPL3-or-later")
arch=("x86_64")
provides=('deemix')
conflicts=('deemix-gui-appimage' 'deemix-gui-git' 'deemix-fix-gui-appimage-git')
depends=('hicolor-icon-theme' 'electron')
makedepends=('git' 'pnpm' 'unappimage-git' 'cairo' 'nodejs' 'electron' 'makepkg-git-lfs-proto')
VCSCLIENTS+=('git-lfs::git-lfs')
source=('git-lfs+https://github.com/username227/DeemixFix-binaries' 'packagefix.patch' 'deemix-gui.desktop')
b2sums=('SKIP'
        '8544eeed4112f12417a6fdd6e22c90a4877d013bafeb009a594314c5f0f0fd612d995af1dfea74a6c24a7f98b782f021eed75d4a8eb2081d63e4b14804fcaafc'
        '7d816fb57e0ee0d584ee1b0cfeee04d3e890bd87ca462656d97dc80e0f54999934a5e9879e74d20d6901cb959c92339fdbbef94aa05c58d6a02e9537d97313ec')
options=('!strip')
#pkgver() {
#  cd DeemixFix
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
#}
# build() {
#	cd $srcdir/DeemixFix
#	pnpm i
#	patch package.json $srcdir/packagefix.patch
#	pnpm dist
#	unappimage $srcdir/DeemixFix/dist/deemix-gui.AppImage
#}
package(){
	install -dm755 $pkgdir/opt/deemix-fix
	install -dm644 $pkgdir/usr/share/icons
	install -dm755 $pkgdir/usr/bin
#	cp -r $srcdir/DeemixFix/dist/linux-unpacked/* $pkgdir/opt/deemix-fix
	cp -rf $srcdir/DeemixFix-binaries/opt/deemix-gui/* $pkgdir/opt/deemix-fix
	cp -rf $srcdir/DeemixFix-binaries/usr $pkgdir
#	mv $pkgdir/opt/deemix-fix/deemix-fix $pkgdir/opt/deemix-gui
	ln -s /opt/deemix-fix/deemix-fix $pkgdir/usr/bin/deemix-gui
#	cp -r $srcdir/DeemixFix/squashfs-root/usr/share/icons/hicolor $pkgdir/usr/share/icons/hicolor
	install -Dm755 $srcdir/deemix-gui.desktop -t $pkgdir/usr/share/applications
}

