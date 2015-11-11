# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=servefile-git
pkgname=servefile-git
pkgver=v0.4.2.r20.ga0b8ae4
pkgrel=1
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="http://seba-geek.de/stuff/servefile/"
license=('GPL3')
depends=('python2')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('servefile-git::git://git.someserver.de/git/servefile/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i -e "s~/usr/bin/python~/usr/bin/python2~g" servefile
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mv servefile "$pkgdir/usr/bin/servefile"
}
