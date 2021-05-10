# Maintainer: Lan Phan <phan.ngoclan58[at]gmail[dot]com>

pkgname=taskflow-git
pkgver=r53.b21cc7c
pkgrel=4
pkgdesc="Simple resource-aware task scheduler"
arch=('x86_64')
url="https://github.com/lanPN85/taskflow"
license=('GPL3')
groups=()
depends=('zlib')
makedepends=('git' 'python-virtualenv' 'binutils')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='install.sh'
source=('git+https://github.com/lanPN85/taskflow#tag=0.3.1')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/taskflow"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/taskflow"
}

build() {
	cd "$srcdir/taskflow"
	test -f "venv" || virtualenv venv/
	. venv/bin/activate
	pip install -r requirements.txt
	pip install -r requirements.dev.txt
	make build
}

check() {
	cd "$srcdir/taskflow"
}

package() {
	cd "$srcdir/taskflow"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	cp etc/taskflowd.service "$pkgdir/usr/lib/systemd/system/taskflowd.service"
}
