# Maintainer: claymorwan <claymorwan@fembois.dev>
# ty to mqs for the service file :3

pkgname=vertd-bin
_pkgname="${pkgname%-bin}"
pkgver=nightly.81
pkgrel=1
pkgdesc="VERT's solution to crappy video conversion services."
arch=(x86_64)
url="https://github.com/VERT-sh/vertd"
license=('GPL-3.0-only')
depends=('ffmpeg')
optdepends=('libva-intel-driver')
provides=($_pkgname)
conflicts=($_pkgname)
options=(!debug)
source=(
	"$_pkgname::$url/releases/download/nightly-91c1e481cbfe79f787102ac7844a4938224ec876/vertd-linux-x86_64"
	"LICENSE::$url/blob/main/LICENSE"
	systemd.service
)
sha256sums=('2e11a59045e4588504f3b5deb50f0f214a88131a0d9082e85cb1f7dc22555d4d'
            'bab97d739915e2363b4d659b671127a91383e6410af5be8e606f8b64143cfd59'
            'a1ec3e72000c476d6f10f09041b4c67ad2d823da2598731682e012d615a036cf')

package() {
	install -vDm644 systemd.service \
		"$pkgdir"/usr/lib/systemd/system/$_pkgname.service

	cd "$srcdir"
	install -Dm0755 $_pkgname -t "$pkgdir/usr/bin"
	chmod +x "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
