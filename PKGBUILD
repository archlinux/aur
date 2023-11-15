_gitfolder=compfy
_gitname=compfy
pkgname=compfy
pkgver=1.6.3
pkgrel=1
pkgdesc="A Better Alternative to Picom. With Animations and Active Support"
arch=(i686 x86_64)
url="https://github.com/allusive-dev/compfy"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre2' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'libglvnd' 'libx11' 'libxcb' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'uthash')
optdepends=('dbus:          To control Compfy via D-Bus')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
source=("${_gitfolder}::git+https://github.com/allusive-dev/compfy.git#tag=${pkgver}")
md5sums=('SKIP')
build() {
	cd "${srcdir}/${_gitfolder}"
	meson setup . build
	ninja -C build
}

package() {
	cd "${srcdir}/${_gitfolder}"
	DESTDIR="$pkgdir/" ninja -C build install

	# install license
	install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

	# example conf
	install -D -m644 "compfy.sample.conf" "${pkgdir}/etc/xdg/compfy.conf.example"

}
