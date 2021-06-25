# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://swarm.ethereum.org/'
license=('BSD')
depends=('bash')
optdepends=('bee-clef: external signer for bee')
provides=('swarm-bee')
conflicts=('swarm-bee')
backup=('etc/bee/bee.yaml')
source=("https://raw.githubusercontent.com/ethersphere/bee/v$pkgver/LICENSE")
source_x86_64=("https://github.com/ethersphere/bee/releases/download/v$pkgver/bee_${pkgver}_amd64.deb")
source_i686=("https://github.com/ethersphere/bee/releases/download/v$pkgver/bee_${pkgver}_386.deb")
source_armv7h=("https://github.com/ethersphere/bee/releases/download/v$pkgver/bee_${pkgver}_armv7.deb")
source_aarch64=("https://github.com/ethersphere/bee/releases/download/v$pkgver/bee_${pkgver}_arm64.deb")
sha512sums=('63cb4eacde7f6f664dc42f07fd2b46dab7c72a621b57ef60481f0f3484445073c8c11310c38a6b85c801be64bc38a6e4c38186ffe0b2abd188d2a6ec6e03a9ab')
sha512sums_x86_64=('b711a6d19d65414cdddfc1498aec572c169283cd4aa35d0d57b0dade453a74d8db0aed6c195ffa32ca78ee8aeb7c546e656b6554dbc4cf80184fcb3429f099f1')
sha512sums_i686=('e9042aae76a7f0882201cab10efdad49dc347ef7bfd7391b75c91111fda20240e405d7efb4126ebc5df8c21f22510ca5146aa605efae0b1d7455805449408476')
sha512sums_armv7h=('4569555ee01887a28704a4d455915dc190eeaeef6abf5b65551f20dd7fdd136fa37ef75a1a1e471f32a0029b65e0fba14210fa682f9e014eb859a630f02aeeac')
sha512sums_aarch64=('d9bae3dea2c11b3af23ce800630a88d4ca2e02061539c877424ade601e0e7e84e34998aea34f344ef458ded1a512dd009ca7d9cdfff63df1603eb0caf61a956d')
install=bee.install

prepare() {
	bsdtar -xf data.tar.gz
}

package() {
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 etc/default/bee -t "$pkgdir/etc/default"
	install -Dm644 etc/bee/bee.yaml -t "$pkgdir/etc/bee"
	install -Dm644 lib/systemd/system/bee.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm755 usr/bin/bee{,-get-addr} -t "$pkgdir/usr/bin"
}
