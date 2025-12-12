# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=himitsu-secret-service
pkgver=0.1
pkgrel=3
pkgdesc='Himitsu secret-service implementation'
url='https://git.sr.ht/~apreiml/himitsu-secret-service'
license=(MIT)
arch=(x86_64 aarch64)
depends=(
	himitsu
	python
	python-himitsu
	python-cryptography
	python-gobject
	python-prctl
	python-xdg
	python-dbus
)
optdepends=("systemd")
makedepends=(python-build python-installer)
provides=(org.freedesktop.secrets)
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~apreiml/himitsu-secret-service/archive/$pkgver.tar.gz"
	"hisecrets-agent.service"
)

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 "$srcdir"/hisecrets-agent.service \
                "$pkgdir/usr/lib/systemd/user/hisecrets-agent.service"

}

sha256sums=(
	"59d6610a7b701b47d53861245dc6a0d1b4e973c818d0e95c1c14ed6582ecfaae"
	"294f7798cc571d35329205c174453d412ca56991e2dfaa1e2172c2a72d3e63d0"
)
