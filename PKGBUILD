# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=idiotic
pkgname=idiotic-git
pkgver=0.1.6-1-g20fbf19
pkgrel=1
pkgdesc='Distributed home automation controller'
arch=('any')
url="https://github.com/umbc-hackafe/$_name"
license=('MIT')
depends=('python>=3.4' 'python-aiohttp>=0.21.2' 'python-docopt>=0.6.2' 'python-pylint>=1.5.4' 'python-schedule>=0.3.2' 'python-werkzeug>=0.11.4')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/umbc-hackafe/$_name.git")
backup=('etc/idiotic/conf.json')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
