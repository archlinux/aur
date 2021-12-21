# Maintainer: Julian Mac Kenzie <jukiangm@gmail.com>
_gitfolder="picom"
pkgname=picom-jonaburg-fix
pkgver=0.1
pkgrel=2
pkgdesc="jonaburg's fork plus a patch for rounded corners and shadows"
arch=(i686 x86_64)
url="https://github.com/Arian8j2/picom-jonaburg-fix"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb' 'libxext' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'asciidoc' 'uthash')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
source=("${_gitfolder}::git+https://github.com/Arian8j2/picom-jonaburg-fix.git")
md5sums=("SKIP")
build() {
	cd "${srcdir}/${_gitfolder}"
	meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
	ninja -C build
}

package() {
	# this is adapted from tryone144's fork PKGBUILD
	cd "${srcdir}/${_gitfolder}"
	DESTDIR="$pkgdir/" ninja -C build install

	# install license
	install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

	# example conf
	install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
