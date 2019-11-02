# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=git-cinnabar
pkgver=0.5.2
pkgrel=1
pkgdesc="Git remote helper to interact with Mercurial repositories"
arch=(x86_64)
url="https://github.com/glandium/$pkgname"
license=(GPL2)
depends=(git mercurial python2)
source=("git+https://github.com/glandium/$pkgname#commit=$pkgver")
sha256sums=(SKIP)

build() {
	cd "$pkgname"
	PYTHONDONTWRITEBYTECODE=1 make
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r CI cinnabar git-cinnabar git-cinnabar-helper git-remote-hg helper mercurial "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	ln -s "/opt/$pkgname/$pkgname-helper" "$pkgdir/usr/bin/$pkgname-helper"
	ln -s "/opt/$pkgname/git-remote-hg" "$pkgdir/usr/bin/git-remote-hg"
}
