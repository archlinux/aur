# Maintainer: Jigsaw <j1g5aw@foxmail.com>

pkgname=plasma-runner-vscode-git
pkgver=r5.7c6bc0c
pkgrel=1
pkgdesc="KRunner plugin for quickly opening recent VSCode workspaces"
arch=('any')
url="https://github.com/j1g5awi/krunner-vscode"
license=('GPL3')
depends=('python' 'python-gobject' 'dbus-python')
makedepends=('git' 'python-pip' 'python-poetry')
source=("plasma-runner-vscode-git::git+https://github.com/j1g5awi/krunner-vscode")
md5sums=('SKIP')
build(){
    cd "$pkgname"
    pip install .
}
package() {
    cd "$pkgname"
    mkdir -p "${pkgdir}/usr/share/kservices5/"
    mkdir -p "${pkgdir}/usr/share/dbus-1/services/"
	install ./package/plasma-runner-vscode.desktop "${pkgdir}/usr/share/kservices5/"
    install ./package/com.github.j1g5awi.vscode.service "${pkgdir}/usr/share/dbus-1/services/"
}
pkgver() {
	cd "$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
