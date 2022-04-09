# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-bin
pkgver=1.5.1
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
source_armv7h=("$pkgname-$pkgver-armv7h.deb::$url/releases/download/v$pkgver/bee_${pkgver}_armv7.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/bee_${pkgver}_arm64.deb")
sha256sums=('be2cfae74a424aa5e5c82480bc91483ddecac4b8b319fd16fa556940ffefce6e'
            '36a50889de810ee1dba3fbcb5cc04942e298b8825e4e4fc4f2eabbd844b2cf39'
            '27465c707fe2600700438cb8c2c5a3b87926ab086ce2e43f72b628650c8de034')
sha256sums_x86_64=('625f741664522263ee178733e75849d3c2441a4653f53389cac080266999b230')
sha256sums_i686=('25c9bc53ed8079c4da68e262c99ca67d82553980d2c692afde96f75fb42af8ed')
sha256sums_armv7h=('64492592b0dcbfd026d07969c8198517e6d639729867dfc0500af778ae6f7ea4')
sha256sums_aarch64=('b90ad01b0bf1b147e16a1f6a63c7be2eef200c6c0a5faee04b7904729cb1741c')
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
