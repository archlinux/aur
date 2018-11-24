# Maintainer: Luke Brocke <luke at luke dot xyz>

pkgname=ssh-agent-filter
pkgver=0.5.2
pkgrel=1
pkgdesc="Filtering proxy for ssh-agent meant to be forwarded to untrusted servers"
arch=('x86_64')
url="https://git.tiwe.de/${pkgname}.git"
license=('GPL3')
depends=('openssh')
optdepends=('dialog')
makedepends=(
    'boost'
    'help2man'
    'pandoc'
    'nettle'
    'gmp'
)
checkdepends=('shunit2')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('317049dc7fee62da1f31a54c7c75009cf26fc8041171426edbc12fdcc3fabf51b29efa400826654f2016e8053c5e543930e1ae62d72e611a20c427c5682037df')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 afssh "$pkgdir/usr/bin/afssh"
    install -Dm755 ssh-agent-filter "$pkgdir/usr/bin/ssh-agent-filter"
    install -Dm755 ssh-askpass-noinput "$pkgdir/usr/bin/ssh-askpass-noinput"

    install -Dm644 afssh.1 "$pkgdir/usr/share/man/man1/afssh.1"
    install -Dm644 ssh-agent-filter.1 \
        "$pkgdir/usr/share/man/man1/ssh-agent-filter.1"
    install -Dm644 ssh-agent-filter.bash-completion \
        "$pkgdir/usr/share/bash-completion/completions/ssh-agent-filter"
    install -Dm644 ssh-askpass-noinput.1 \
        "$pkgdir/usr/share/man/man1/ssh-askpass-noinput.1"

    install -Dm644 GPL-3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 changelog "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}
