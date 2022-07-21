# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-bin
pkgver=1.6.3
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
sha256sums_x86_64=('8d7f49ebcef02d987b8f00256fd1ab939366c90c04885ac0861d268363756970')
sha256sums_i686=('af04d98d38b1ec4d707fe94ee23e5837ad9b532959922c3f8df1dba1e09d34ec')
sha256sums_armv7h=('522a079efc767bfeaaefd86e34ee356de0bd6d3ae0d0756d0d3b5f4c9f59a03c')
sha256sums_aarch64=('b4217e72d1a45dbd136258498a4da2c55d0ee676fa2fb043448626cdfc0fa9e1')
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
