# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=idiotic
pkgname=idiotic-git
pkgver=0.1.6.r1.g20fbf19
pkgrel=6
pkgdesc='Distributed home automation controller'
arch=('any')
url="https://github.com/idiotic/$_name"
license=('MIT')
depends=('python>=3.4' 'python-aiohttp>=0.21.2' 'python-docopt>=0.6.2' 'python-pylint>=1.5.4' 'python-schedule>=0.3.2' 'python-werkzeug>=0.11.4')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/idiotic/$_name.git")
backup=('etc/idiotic/conf.json')
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_name"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
