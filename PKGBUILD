# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.4.6
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
install=informant.install
makedepends=('python-setuptools')
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser' 'python-html2text' 'python-cachecontrol' 'python-lockfile')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
options=(zipman)
sha256sums=('dd181b87426dd11c16e24f20bed8b8d83898990a36d0017fa8f6df6a2f1b649e')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    /usr/bin/python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    export PYTHONHASHSEED=0
    /usr/bin/python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 0644 $pkgname.hook -T $pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
    install -Dm 0644 man/$pkgname.1 -t $pkgdir/usr/share/man/man1/
}
