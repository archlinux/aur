# Maintainer: hikyae <h1ky43@gmail.com>
pkgname=deepcool-ak620-digital-linux-git
pkgver=r34.0585b96
pkgrel=1
pkgdesc="Python script to control DeepCool AK620 and AK500S CPU coolers on Linux"
arch=('x86_64')
url="https://github.com/hikyae/deepcool-ak620-digital-linux"
license=('MIT')
depends=('python' 'python-hidapi' 'python-psutil')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout main
}

package() {
	install -Dm755 "$srcdir/${pkgname%-git}/deepcool-ak620-digital" "$pkgdir/usr/bin/deepcool-ak620-digital"
	install -Dm644 "$srcdir/${pkgname%-git}/deepcool-ak620-digital.service" "$pkgdir/usr/lib/systemd/system/deepcool-ak620-digital.service"
	install -Dm644 "$srcdir/${pkgname%-git}/deepcool-ak620-digital-restart.service" "$pkgdir/usr/lib/systemd/system/deepcool-ak620-digital-restart.service"
}
