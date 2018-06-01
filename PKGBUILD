# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.7.1
pkgrel=2
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-setuptools' 'python-xdg' 'pyalpm' 'sudo' 'git')
optdepends=("bash-completion: for bash completions")
source=("https://github.com/enckse/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('90462db2624c4a1ad8ca4c9a813aef07410b1f7ff4b287f22f73329fc642819b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make completions manpages
}
package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions "$pkgdir"/usr/share/bash-completion/completions/$pkgname
    install -Dm644 scripts/makepkg "$pkgdir"/usr/share/$pkgname/makepkg
    install -Dm644 bin/naaman.8.gz "$pkgdir"/usr/share/man/man8/naaman.8.gz
    install -Dm644 bin/naaman.conf.5.gz "$pkgdir"/usr/share/man/man5/naaman.conf.5.gz
    python setup.py install --root="$pkgdir/" --optimize=1
}
