# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=himitsu-secret-service
pkgver=r237.12792b3
pkgrel=1
pkgdesc='Himitsu secret-service implementation'
url='https://git.sr.ht/~apreiml/himitsu-secret-service'
license=(MIT)
arch=(x86_64 aarch64)
depends=(python himitsu)
optdepends=("systemd")
makedepends=(python-build python-installer)
provides=(org.freedesktop.secrets)
source=(
	"${pkgname}::git+https://git.sr.ht/~apreiml/himitsu-secret-service"
	"hisecrets-agent.service"
)

pkgver() {
        cd "$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 "$srcdir"/hisecrets-agent.service \
                "$pkgdir/usr/lib/systemd/user/hisecrets-agent.service"

}

sha256sums=(
	"SKIP"
	"294f7798cc571d35329205c174453d412ca56991e2dfaa1e2172c2a72d3e63d0"
)
