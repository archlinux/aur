# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-clef-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Go Ethereum's external signer"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://swarm.ethereum.org/'
license=('GPL3')
depends=('bash')
provides=('swarm-bee-clef')
conflicts=('swarm-bee-clef' 'go-ethereum')
replaces=('bee-clef-bin')
backup=('etc/bee-clef/4byte.json'
        'etc/bee-clef/rules.js')
source_x86_64=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_amd64.deb")
source_armv7h=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_armv7.deb")
source_aarch64=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_arm64.deb")
sha256sums_x86_64=('59df79c5dc49992cd5f9f02265ac7a5f2480a9d7f1d89959abb2f5ad419872d0')
sha256sums_armv7h=('844862550d19dcdbc5024dbc617689a1073284c2f4eaaf832b50ce57d7ae5726')
sha256sums_aarch64=('f8100d7c9f9767567fbe65a993ce0f175cc27862b72cad65de61ecf2f48a82db')
install=bee-clef.install

prepare() {
	bsdtar -xf data.tar.gz
}

package() {
	install -Dm644 etc/bee-clef/{4byte.json,rules.js} -t "$pkgdir/etc/bee-clef"
	install -Dm644 lib/systemd/system/bee-clef.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm755 usr/bin/bee-clef-{keys,service} -t "$pkgdir/usr/bin"
	install -Dm755 usr/bin/clef -t "$pkgdir/usr/bin"
}

