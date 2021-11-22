# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=git-cinnabar-git
pkgver=0.5.0.r575.g04b8365
pkgrel=1
pkgdesc="Git remote helper to interact with Mercurial repositories"
arch=(x86_64)
url='https://github.com/glandium/git-cinnabar'
license=(GPL2)
depends=(git mercurial python)
provides=('git-cinnabar')
conflicts=('git-cinnabar')
source=('git+https://github.com/glandium/git-cinnabar.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git-cinnabar"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd git-cinnabar
	PYTHONDONTWRITEBYTECODE=1 make
}

package() {
	cd git-cinnabar
	mkdir -p "$pkgdir/opt/git-cinnabar"
	cp -r cinnabar git-cinnabar git-cinnabar-helper git-remote-hg mercurial "$pkgdir/opt/git-cinnabar"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/git-cinnabar/git-cinnabar" "$pkgdir/usr/bin/git-cinnabar"
	ln -s "/opt/git-cinnabar/git-cinnabar-helper" "$pkgdir/usr/bin/git-cinnabar-helper"
	ln -s "/opt/git-cinnabar/git-remote-hg" "$pkgdir/usr/bin/git-remote-hg"
}
