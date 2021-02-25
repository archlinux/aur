# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.4.3
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
install=informant.install
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser' 'python-html2text' 'python-cachecontrol' 'python-lockfile')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6dfa5d09910565147f3783a4e3f7db388394f6a46c03a097b88a3a8a86153060')

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
    gzip $pkgdir/usr/share/man/man1/$pkgname.1
}
