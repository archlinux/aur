# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-ehforwarderbot-git
pkgver=r388.690be0d
pkgrel=1
pkgdesc='An extensible message tunneling chat bot framework. Delivers messages to and from multiple platforms and remotely control your accounts.'
arch=('any')
url='https://github.com/blueset/ehForwarderBot'
license=('AGPL-3')
groups=('efb')
depends=('python-ruamel-yaml' 'python-asciimatics' 'python-cjkwrap' 'python-typing-extensions')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}.git"
       ehforwarderbot@.service)
md5sums=('SKIP'
         'e5acd5cc51ffb0ff891d56c9fa7dcb10')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

install=ehforwarderbot.install

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root $pkgdir
	install -Dm644 $srcdir/ehforwarderbot@.service $pkgdir/usr/lib/systemd/system/ehforwarderbot@.service
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}
