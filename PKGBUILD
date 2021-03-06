# Maintainer: Vyacheslav Konovalov <crabvk@protonmail.com>

pkgname=bee-clef-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="Go Ethereum's external signer"
arch=('x86_64')
url='https://swarm.ethereum.org/'
license=('GPLv3')
depends=('bash')
backup=(
    'etc/bee-clef/4byte.json'
    'etc/bee-clef/rules.js'
)
source=(
    "https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_amd64.deb"
    'https://raw.githubusercontent.com/ethersphere/bee-clef/master/LICENSE'
)
sha512sums=(
    '0f93e2f025d1e3aa00ee827e890cfd752b3eccbd959d5858e8ad6b6e53a359c3ff763ff5927b417f5a6dae2f7bbfd2003e31935d762d2ea1c6ff389dd5dabc9e'
    'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
)
install='bee-clef.install'

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/bee-clef"
    install -Dm644 etc/bee-clef/{4byte.json,rules.js} -t "$pkgdir/etc/bee-clef"
    install -Dm644 lib/systemd/system/bee-clef.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm755 usr/bin/bee-clef-{keys,service} -t "$pkgdir/usr/bin"
    install -Dm755 usr/bin/clef -t "$pkgdir/usr/bin"
}
