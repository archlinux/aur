# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Bradley Nelson <bradleynelson102@gmail.com>
pkgname=system-bridge-git
gitname=system-bridge
pkgver=v2.2.1.r4.g89f9466
pkgrel=1
pkgdesc="A bridge for your systems"
arch=('any')
url="https://system-bridge.timmo.dev/"
license=('MIT')
groups=()
depends=()
makedepends=(git yarn) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("system-bridge" "system-bridge-bin")
replaces=()
backup=()
options=()
install=
source=("git://github.com/timmo001/${gitname}" system-bridge.desktop)
noextract=()
md5sums=('SKIP' '3f8b60172f0a2d5699767b1baac8e670')

pkgver() {
	cd "$srcdir/${gitname}"
	git describe --long --tags| sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${gitname}"
	yarn install:all
}

build() {
	cd "$srcdir/${gitname}"
	yarn package
}

package() {
	cd "$srcdir/${gitname}"
	mkdir -p "${pkgdir}"/usr/local/share/system-bridge
	pwd
	echo "${pkgdir}"
	install -Dm755 ./LICENSE "${pkgdir}"/usr/share/licenses/system-bridge/LICENSE
	install -Dm755 ./out/system-bridge "${pkgdir}"/usr/local/share/system-bridge/system-bridge
	install -Dm755 ./out/system-bridge-circle.ico "${pkgdir}"/usr/local/share/system-bridge/system-bridge-circle.ico
	install -Dm755 ./out/system-bridge-circle.png "${pkgdir}"/usr/local/share/system-bridge/system-bridge-circle.png
	install -Dm755 ./out/system-bridge-tray "${pkgdir}"/usr/local/share/system-bridge/system-bridge-tray
	install -Dm755 ./out/xdg-open "${pkgdir}"/usr/local/share/system-bridge/xdg-open
	install -Dm755 ./out/traybin/tray_linux_release "${pkgdir}"/usr/local/share/system-bridge/traybin/tray_linux_release
	install -Dm755 $srcdir/system-bridge.desktop $pkgdir/usr/share/applications/system-bridge.desktop 
}

# check() {
# 	cd "$srcdir/${pkgname%-git}"
# 	yarn test
# }
