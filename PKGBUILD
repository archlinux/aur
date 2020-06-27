# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=liketaskmanager-git
pkgver=2.2.r0.gfe7ebc6
pkgrel=1
pkgdesc="Tool that mimics the permformance monitoring of Windows Task Manager"
arch=('x86_64')
url="https://github.com/rejuce/LikeTaskManager"
license=('GPL3')
depends=('qwt' 'nethogs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/rejuce/LikeTaskManager.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'fc8e72a0f140fdffe8f44e375418c9f03814251e3d67e797c45cad703be458ab')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/lqwt-qt5/lqwt/g' LikeTaskManager.pro
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake -o Makefile LikeTaskManager.pro -spec linux-g++ CONFIG+=qtquickcompiler
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 LikeTaskManager "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
