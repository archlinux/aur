# Maintainer: mar77i <mar77i at protonmail dot ch>

pkgname=switcher-git
pkgver=r7.c9d4705
pkgrel=1
pkgdesc="Run SSH and HTTP(S) on the same port"
arch=('i686' 'x86_64')
url="https://github.com/jamescun/switcher"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc-go') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('git+https://github.com/jamescun/switcher.git'
        switcher.service
        switcher.socket)
noextract=()
sha1sums=('SKIP'
          'a8fe9ff7916611d5f042a3bf63c592b2baafec9e'
          'b2f36de929c1131e41c8e29037c51bedbbfb82de')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 switcher "${pkgdir}/usr/bin/switcher"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	install -m644 ../switcher.{socket,service} "${pkgdir}/usr/lib/systemd/system"
}
