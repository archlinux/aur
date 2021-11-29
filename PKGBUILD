# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=swarm-bee-clef-bin
pkgver=0.6.0
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
install=bee-clef.install
source=('bee-clef.sysusers' 'bee-clef.tmpfiles')
source_x86_64=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_amd64.deb")
source_armv7h=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_armv7.deb")
source_aarch64=("https://github.com/ethersphere/bee-clef/releases/download/v$pkgver/bee-clef_${pkgver}_arm64.deb")
sha256sums=('7314d2aa0ce149621a5d59b881ada3ea37231743b5875389b3041bb845233491'
            'c5dbcb978de5b7c31482f4fd1cff3101a738df85e27758ec2b4e469a1762384c')
sha256sums_x86_64=('573f5790c5ec408b4a151514d9791114d3247de517297aaea0825b68ed10b515')
sha256sums_armv7h=('a1fdc1492aea688370f2892a63f5cff73e0d3f7cbc3293c9237254e81da86b7b')
sha256sums_aarch64=('6bf6b7cf15dc7312d25636593048ef0ce6b55b4fbb282d49c6ad00d14bf75f9e')

prepare() {
	bsdtar -xf data.tar.gz
}

package() {
	install -D usr/bin/bee-clef-{keys,service} -t "$pkgdir/usr/bin"
	install -D usr/bin/clef -t "$pkgdir/usr/bin"
	install -Dm644 etc/bee-clef/{4byte.json,rules.js} -t "$pkgdir/etc/bee-clef"
	install -Dm644 lib/systemd/system/bee-clef.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 bee-clef.sysusers "$pkgdir/usr/lib/sysusers.d/bee-clef.conf"
	install -Dm644 bee-clef.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/bee-clef.conf"
}
