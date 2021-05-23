# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('BSD-3-Clause')
depends=('bash')
optdepends=('bee-clef: external signer for bee')
backup=('etc/bee/bee.yaml')
source=(
    "https://github.com/ethersphere/bee/releases/download/v$pkgver/bee_${pkgver}_amd64.deb"
    'https://raw.githubusercontent.com/ethersphere/bee/master/LICENSE'
)
sha512sums=(
    '38b014754c04fb2e419e1275b2b30d1bd911ada3a3ccaec2ed471a9c45c08d6a41b46f09ecadbd958104ef91ccddb5f202a1b8dbab01fafff904a35718649b0b'
    '63cb4eacde7f6f664dc42f07fd2b46dab7c72a621b57ef60481f0f3484445073c8c11310c38a6b85c801be64bc38a6e4c38186ffe0b2abd188d2a6ec6e03a9ab'
)
install='bee.install'

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee"
    install -Dm644 etc/default/bee -t "$pkgdir/etc/default"
    install -Dm644 etc/bee/bee.yaml -t "$pkgdir/etc/bee"
    install -Dm644 lib/systemd/system/bee.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 usr/bin/bee{,-get-addr} -t "$pkgdir/usr/bin"
}
