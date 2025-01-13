# Maintainer: bobpaul <bobpaul@users.noreply.github.com>
# contact me via AUR or archlinux forums
pkgname=mavlink-router-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v3.r26.51983a4
pkgrel=1
pkgdesc="Route mavlink packets between endpoints (serial, tcp, udp, etc)"
arch=('x86_64')
url="https://github.com/intel/mavlink-router"
license=('Apache 2.0')
groups=()
depends=()
makedepends=('git' 'meson' 'gcc' 'systemd') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/intel/mavlink-router.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
	meson setup \
	  --buildtype=release \
	  build .
}

build() {
	cd "$srcdir/${pkgname%-git}"
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="${pkgdir}/" ninja -C build install
}
