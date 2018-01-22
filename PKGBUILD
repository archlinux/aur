# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.4.0
pkgrel=1
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-xdg' 'pyalpm' 'sudo')
optdepends=("bash-completion: for bash completions"
            "git: for installing packages (instead of tar)")
makedepends=('help2man')
source=("https://github.com/enckse/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('950faaed0145573ee56763b9224f306c7791b89e24c42a5c88c01183cb52fc4a')

build() {
    cd $srcdir/$pkgname
    make completions manpages
}
package() {
    cd $srcdir/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions $pkgdir/usr/share/bash-completion/completions/$pkgname
    install -Dm755 naaman.py $pkgdir/usr/bin/naaman
    install -Dm644 scripts/makepkg $pkgdir/usr/share/$pkgname/makepkg
    install -Dm644 bin/naaman.8.gz $pkgdir/usr/share/man/man8/naaman.8.gz
    install -Dm644 bin/naaman.conf.5.gz $pkgdir/usr/share/man/man5/naaman.conf.5.gz
}

