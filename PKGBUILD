# Maintainer: Luke Brocke <luke at luke dot xyz>

pkgname=ssh-agent-filter
pkgver=0.5.1
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
)
checkdepends=('shunit2')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9105bfcca37f4cf0c25cf5037ce6ba90ae71361a7215ce396ba1b603d65f930ba3437d7c6f2b80d1e918edccc1a876636c6ffc60995351cb3a8bd3e53b91067d')

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

    install -Dm555 afssh "$pkgdir/usr/bin/afssh"
    install -Dm555 ssh-agent-filter "$pkgdir/usr/bin/ssh-agent-filter"
    install -Dm555 ssh-askpass-noinput "$pkgdir/usr/bin/ssh-askpass-noinput"

    install -Dm644 afssh.1 "$pkgdir/usr/share/man/man1/afssh.1"
    install -Dm644 ssh-agent-filter.1 \
        "$pkgdir/usr/share/man/man1/ssh-agent-filter.1"
    install -Dm644 ssh-agent-filter.bash-completion \
        "$pkgdir/usr/share/bash-completion/ssh-agent-filter"
    install -Dm644 ssh-askpass-noinput.1 \
        "$pkgdir/usr/share/man/man1/ssh-askpass-noinput.1"

    install -Dm644 GPL-3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 changelog "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}
