# Maintainer: Anton Leontiev <scileont /at/ gmail.ru>
pkgname=scout-git
pkgver=1.0
pkgrel=1
pkgdesc='A CLI interface to Tomboy and Gnote'
arch=('any')
url='https://github.com/lelutin/scout'
license=('BSD')
depends=('python-setuptools' 'python-dbus')
makedepends=('git' 'pandoc')
optdepends=('tomboy: either this one' 'gnote: or that one must be installed')
provides=('scout')
conflicts=('scout')
source=('scout::git+git://github.com/lelutin/scout.git' 'scout-man.patch')
md5sums=('SKIP'
	'67bb8bbfb7370496644c737638566207')

pkgver() {
	cd ${pkgname%-git}
	printf '%s' "$(git describe --tags | sed 's/^v//;s/-/.r/;s/-/./')"
}

prepare() {
	cd ${pkgname%-git}
	patch -i "$srcdir/scout-man.patch"
}

package() {
	cd ${pkgname%-git}
	python setup.py install --root "$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
