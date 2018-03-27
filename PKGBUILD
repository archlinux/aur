# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.6.4
pkgrel=1
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-setuptools' 'python-xdg' 'pyalpm' 'sudo' 'git')
optdepends=("bash-completion: for bash completions")
source=("https://github.com/enckse/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e8d1753ccdcc3cbb2c4a31657c70770bda1d0228d39db7e917aa15aa2d5553f5')

build() {
    cd $srcdir/$pkgname-$pkgver
    make completions manpages
}
package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions $pkgdir/usr/share/bash-completion/completions/$pkgname
    install -Dm644 scripts/makepkg $pkgdir/usr/share/$pkgname/makepkg
    install -Dm644 bin/naaman.8.gz $pkgdir/usr/share/man/man8/naaman.8.gz
    install -Dm644 bin/naaman.conf.5.gz $pkgdir/usr/share/man/man5/naaman.conf.5.gz
    python setup.py install --root="$pkgdir/" --optimize=1
}
