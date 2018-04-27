# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
pkgname=i3-exitx-systemd-git
pkgver=r16.309536f
pkgrel=1
pkgdesc="GTK logout dialog for i3 with systemd commands"
arch=('x86_64')
url="https://github.com/ranisalt/i3-exitx-systemd"
license=('custom')
depents=('gdk-pixbuf2' 'gtk3' 'libx11')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

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
    install -Dm755 exitx "${pkgdir}/usr/bin/exitx"
}
