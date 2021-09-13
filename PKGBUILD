# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
pkgname=hack-browser-data-git
pkgrel=1
pkgver=r153.ea137f9
pkgdesc="hack-browser-data is an open-source tool that could help you decrypt data ( password|bookmark|cookie|history|credit card|downloads link ) from the browser."
arch=(x86_64)
url="https://github.com/moonD4rk/HackBrowserData"
license=('MIT')
depends=("glibc")
optdepends=()
makedepends=("git" "go") # 'bzr', 'git', 'mercurial' or 'subversion'
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/HackBrowserData"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/HackBrowserData"
    go get -v -t -d ./...
    go build
}

package() {
	cd "$srcdir/HackBrowserData"
    install -D -m755 "$srcdir/HackBrowserData/hack-browser-data" "$pkgdir/usr/bin/hack-browser-data"
}

