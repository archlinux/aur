# Maintainer: Anton Strömkvist <anton@stromkvist.com>
pkgname=log-git
pkgver=r986.0e531d2
pkgrel=1
pkgdesc="Log & time-tracker"
arch=('x86_64')
url="https://github.com/joshavanier/log"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'npm')
provides=("log")
conflicts=("log")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/joshavanier/log.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	npm install
}

build() {
	cd "$srcdir/${pkgname%-git}"
  npm run-script build_linux
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/lib/"
  cp -r "$srcdir/${pkgname%-git}/build/Log-linux-x64" "${pkgdir}/usr/lib/Log"
	ln -s "/usr/lib/Log/Log" "${pkgdir}/usr/bin/Log"
}
