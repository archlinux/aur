# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
pkgname='light'
pkgver='1.2.2'
pkgrel='4'
pkgdesc='A program to control backlights (and other hardware lights)'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/perkele1989/$pkgname"
license=('GPL-3.0-only')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-global-var.diff::$url/commit/eae912ca7ff3356805e47739114861d2b6ae7ec0.diff"
	"$pkgname-$pkgver-namespace-udev-rule.diff::$url/commit/260e2c1a557597d3430582dcc6347b0b804590c6.diff"
	"$pkgname-$pkgver-update-manpage.diff::$url/commit/3b318524fa84b9fdfedcd54bb760bd361ed32553.diff"
)
sha512sums=('5815394fb1545d1e06234c261d475e1836e4c43e47e7707b8628891d20b70db04f1661b78ca1d236d549c734430b606498fa46de060c854791b13cf49de07b59'
            'e020deaca76f65a032f6f694f07b43af6318d46f52e0e16554a883d54c43c5519c7bbb3ecbc6e8f39d2828fbebe73d37aa82d4051b2cc652a1775286188b6ded'
            '1cee6c3f10a6534e03bdf6874b95e699fdf8900f7cb9d86df6f8b99f0f77ff2b80d515eb3f4e43602f5ae19fa3009db63301ff862f1d02b8a17f3282ea063232'
            '36cad74b303c206035dd6941269209278c0661358820444ce97b6ef383761e258ccf56d12c80590278972db0e1be98fae3632269cbababc49690726a61fc1708')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "../$pkgname-$pkgver-fix-global-var.diff"
	patch --forward -p1 < "../$pkgname-$pkgver-namespace-udev-rule.diff"
	patch --forward -p1 < "../$pkgname-$pkgver-update-manpage.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	./autogen.sh
	./configure --prefix='/usr' --with-udev
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
