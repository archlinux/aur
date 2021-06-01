# Maintainer: MFW78 <mfw78@chasingseed.com>

pkgname=swarm-bee
pkgver=0.6.2
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('BS2D-3-Clause')
depends=('bash')
optdepends=('swarm-bee-clef: external signer for bee')
makedepends=('go' 'git')
options=('!strip' '!buildflags' '!makeflags')
conflicts=('swarm-bee-bin')
backup=('etc/bee/bee.yaml')
source=("git+https://github.com/ethersphere/bee.git#tag=v${pkgver}")
sha512sums=('SKIP')
install="${pkgname}.install"

build() {
    cd "$srcdir/bee"
    make binary
}

package() {
    cd "$srcdir/bee"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee"
    install -Dm644 packaging/default -t "$pkgdir/etc/default"
    mv $pkgdir/etc/default/default $pkgdir/etc/default/bee
    install -Dm644 packaging/bee.yaml -t "$pkgdir/etc/bee"
    install -Dm644 packaging/bee.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 packaging/bee-get-addr -t "$pkgdir/usr/bin"
    install -Dm755 dist/bee -t "$pkgdir/usr/bin"
}
