# Maintainer: stef204 <stef204 AT [*] (where[*]=yandex DOT com)>

pkgname=ptask
pkgver=0.0.9
pkgrel=3
pkgdesc="A GTK+ graphical user interface for managing tasks in taskwarrior"
arch=('i686' 'x86_64')
url="http://wpitchoune.net/ptask"
license=('GPL2')
depends=('task' 'json-c' 'gtk3' 'hicolor-icon-theme')
optdepends=('asciidoc: required to generate html version of NEWS and README'
	 'help2man: required to regenerate manpages automatically')
install=$pkgname.install
source=("http://wpitchoune.net/ptask/files/$pkgname-$pkgver.tar.gz" "task-2.4.1-1.patch")
sha256sums=('24df60301bd7e94ab56187f8fcd11e64c6589a72b95970ff880069ca200fc9e8'
            '80ec8f7e11fff4de6ce69160dccc588ec2f5244ed30632c32f8fe8a1a93050a0')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p2 < $srcdir/task-2.4.1-1.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr  --sysconfdir=/usr/share
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
