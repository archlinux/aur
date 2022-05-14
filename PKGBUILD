# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/ethersphere/bee'
license=('BSD')
depends=('bash')
optdepends=('swarm-bee-clef: external signer for bee')
provides=('swarm-bee')
conflicts=('swarm-bee')
backup=('etc/bee/bee.yaml')
source=('LICENSE' 'bee.sysusers' 'bee.tmpfiles')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/bee_${pkgver}_amd64.deb")
source_i686=("$pkgname-$pkgver-i686.deb::$url/releases/download/v$pkgver/bee_${pkgver}_386.deb")
source_armv7h=("$pkgname-$pkgver-armv7h.deb::$url/releases/download/v$pkgver/bee_${pkgver}_armhf.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/bee_${pkgver}_arm64.deb")
sha256sums=('be2cfae74a424aa5e5c82480bc91483ddecac4b8b319fd16fa556940ffefce6e'
            '36a50889de810ee1dba3fbcb5cc04942e298b8825e4e4fc4f2eabbd844b2cf39'
            '27465c707fe2600700438cb8c2c5a3b87926ab086ce2e43f72b628650c8de034')
sha256sums_x86_64=('91ab15524e46a8b5fe56a1baaadfc6c5a426252e44870d3e18a521a176d2e8ba')
sha256sums_i686=('93af15c21a20c5c4b4177f4e87e1394895d0151a4100c94327e38f9f78e65a0d')
sha256sums_armv7h=('c6c19c9b780c95f1ebbc861d8c27d512ee0ac4e95b11296be90db7af2a4168e4')
sha256sums_aarch64=('9f14935455a388e95690874e2933dc4d4fa0b546dab4bb18713536844fd4d299')
install=bee.install

prepare() {
	bsdtar -xf data.tar.gz
}

package() {
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 etc/default/bee -t "$pkgdir/etc/default"
	install -Dm644 etc/bee/bee.yaml -t "$pkgdir/etc/bee"
	install -Dm644 lib/systemd/system/bee.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 bee.sysusers "$pkgdir/usr/lib/sysusers.d/bee.conf"
	install -Dm644 bee.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/bee.conf"
	install -D usr/bin/bee{,-get-addr} -t "$pkgdir/usr/bin"
}
