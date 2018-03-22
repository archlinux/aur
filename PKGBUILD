# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.5.1
pkgrel=2
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-xdg' 'pyalpm' 'sudo' 'git')
optdepends=("bash-completion: for bash completions")
makedepends=('help2man')
source=("https://github.com/enckse/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('da90e0c42f3ae9c4792dd641f451ee3c840b39b67b7fd8e70727ee177c83cca9')

build() {
    cd $srcdir/$pkgname-$pkgver
    make completions manpages
}
package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions $pkgdir/usr/share/bash-completion/completions/$pkgname
    install -Dm755 naaman.py $pkgdir/usr/bin/naaman
    install -Dm644 scripts/makepkg $pkgdir/usr/share/$pkgname/makepkg
    install -Dm644 bin/naaman.8.gz $pkgdir/usr/share/man/man8/naaman.8.gz
    install -Dm644 bin/naaman.conf.5.gz $pkgdir/usr/share/man/man5/naaman.conf.5.gz
}

