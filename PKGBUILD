# Maintainer: David Londoño <davidlo176@gmail.com>
pkgbase=skr
pkgname=skr-git
_gitname='skr'
pkgver=r115.70fad82
pkgrel=1
pkgdesc="Low level key remapping"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/DavRack/skr"
license=('GPL')
groups=()
depends=('interception-tools' 'sudo' 'python')
makedepends=('git' 'gcc')
provides=('skr')
source=('skr::git://github.com/DavRack/skr')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
    ./install.sh -b
}

package() {
	cd "${srcdir}/${_gitname}"
    mkdir -p "$pkgdir/usr/share/skr/"
    cp -r ./src/parser "$pkgdir/usr/share/skr/"
    install -D -m755 skrkid "$pkgdir/usr/share/skr/"
    install -D -m755 skrcore "$pkgdir/usr/share/skr/"
    install -D -m755 skr "$pkgdir/usr/bin/${_gitname}"
}
