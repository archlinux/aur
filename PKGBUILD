# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

_pkgname=patcher9x
pkgname=$_pkgname-git
pkgver=v0.9.90.r90.b0cf0e2
pkgrel=1
pkgdesc="Patch for Windows 9x to fix CPU issues"
arch=('i686' 'x86_64')
url="https://github.com/JHRobotics/patcher9x"
license=('MIT')
makedepends=(git gcc make fasm)
provides=(patcher9x)
conflicts=(patcher9x)
source=("git+https://github.com/JHRobotics/patcher9x.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --tags)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$_pkgname"
	make RELEASE=1
}

package() {
	cd "$_pkgname"
	install -Dm755 patcher9x "$pkgdir/usr/bin/patcher9x"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
}
