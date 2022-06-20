# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-ssh
pkgver='0.1'
pkgrel=1
pkgdesc='Himitsu integration for SSH'
arch=(x86_64)
url='https://git.sr.ht/~sircmpwn/himitsu-ssh'
license=(GPL3)
depends=(himitsu)
makedepends=(hare hare-ssh scdoc)
install=himitsu-ssh.install
_extracted="$pkgname-$pkgver"
source=("$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('dfc8a1a1797a6d040a5f2cacf29c3c7a1608be1d9e3c5c0265a7d852087cf437')

build() {
	cd "$srcdir/$_extracted"
	make
}

check() {
	cd "$srcdir/$_extracted"
	make check
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	cd "$srcdir"
	install -Dm644 ../hissh-agent.service \
		"$pkgdir/usr/lib/systemd/user/hissh-agent.service"
}
