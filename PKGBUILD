_gitfolder=picom-allusive
_gitname=picom-allusive
pkgname=picom-allusive
pkgver=1.6.0
pkgrel=1
pkgdesc="The only Picom fork you will ever need. With Animations and More"
arch=(i686 x86_64)
url="https://github.com/allusive-dev/compfy"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre2' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'libglvnd' 'libx11' 'libxcb' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'uthash')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
source=("${_gitfolder}::git+https://github.com/allusive-dev/picom-allusive.git#tag=${pkgver}")
md5sums=('SKIP')
build() {
	cd "${srcdir}/${_gitfolder}"
	meson setup --buildtype=release . build
	ninja -C build
}

package() {
	cd "${srcdir}/${_gitfolder}"
	DESTDIR="$pkgdir/" ninja -C build install

	# install license
	install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

	# example conf
	install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"

}
