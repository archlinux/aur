# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: jort93 <jort93@gmx.de>
pkgname="dol-git"
pkgver=0.3.11.4.r3845.343e474e4
pkgrel=1
pkgdesc="Degrees of Lewdity, browser-based NSFW(18+) game by Vrelnir"
arch=('any')
url="https://vrelnir.blogspot.com"
license=('cc-by-nc-sa-4.0')
makedepends=('git')
provides=(dol)
source=('degrees-of-lewdity::git+https://gitgud.io/Vrelnir/degrees-of-lewdity.git' 'dol')
md5sums=('SKIP'
         '18d1a258ecaff1c9708635ead15df35b')
         
pkgver() {
	cd "degrees-of-lewdity"
	printf "%s.r%s.%s" "$(cat version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "degrees-of-lewdity"
	FORCE_VERSION='' ./compile.sh
}

package() {
	cd "degrees-of-lewdity"
	install -Dm755 "./Degrees of Lewdity.html" "$pkgdir/usr/share/dol/degrees-of-lewdity.html"
	cp -R img "$pkgdir/usr/share/dol/img"
	cp -R game "$pkgdir/usr/share/dol/game"
	cd ..
    install -Dm755 "dol" "$pkgdir/usr/bin/dol"
}
