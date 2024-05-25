pkgname=element-call-git
pkgdesc="Group calls powered by Matrix"
url="https://github.com/element-hq/element-call"
license=("Apache-2.0")
arch=("any")
pkgver=0.5.16.r71.gf701886a
pkgrel=1
makedepends=("yarn" "liburing")
depends=()
source=("git+${url}.git")
md5sums=("SKIP")
provides=("element-call")
conflicts=("element-call")
options=()
backup=()

function pkgver() {
	cd element-call
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd element-call
	yarn
}

function build() {
	cd element-call
	yarn build
}

function package() {
	cd element-call
	install -d "${pkgdir}/usr/share/webapps/element-call"
	cp -r dist/* "${pkgdir}/usr/share/webapps/element-call"
}
