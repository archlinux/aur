# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.4.1
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
install=informant.install
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser' 'python-html2text' 'python-cachecontrol' 'python-lockfile')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e616dd32d275fccfeaa65fa1890d706075dd5f54a2b03351349adb40b308c8ca')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}" --skip-build
    install -Dm 0644 $pkgname.hook -T $pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
    install -Dm 0644 man/$pkgname.1 -t $pkgdir/usr/share/man/man1/
    gzip $pkgdir/usr/share/man/man1/$pkgname.1
}
