# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=naaman
pkgver=0.8.0
pkgrel=1
pkgdesc="Not Another Aur MANager"
arch=("any")
url="https://github.com/enckse/$pkgname"
license=('MIT')
depends=('python' 'python-setuptools' 'python-xdg' 'pyalpm' 'sudo' 'git')
optdepends=("bash-completion: for bash completions")
source=("https://github.com/enckse/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a717abeb59551802062406ea9b9d03e588a8a09cdb7f6d04cef236d9a8bd8534')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make completions manpages
}
package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 bin/bash.completions "$pkgdir"/usr/share/bash-completion/completions/$pkgname
    install -Dm644 bin/naaman.8.gz "$pkgdir"/usr/share/man/man8/naaman.8.gz
    install -Dm644 bin/naaman.conf.5.gz "$pkgdir"/usr/share/man/man5/naaman.conf.5.gz
    python setup.py install --root="$pkgdir/" --optimize=1
}
