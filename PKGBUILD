# Maintainer: robertfoster
# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

pkgname=gmusicproxy
pkgver=1.0.11
pkgrel=1
pkgdesc="Stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/M0Rf30/gmusicproxy"
license=('GPL')
depends=('python-gmusicapi' 'python-netifaces' 'python-xdg' 'python-eyed3' 'python-daemon')
optdepends=('python-keyring: keyring support')
makedepends=('python-setuptools')
source=("https://github.com/M0Rf30/gmusicproxy/archive/${pkgver}.tar.gz"
	"$pkgname.service"
	"$pkgname.sysuser"
	"$pkgname.tmpfiles"
)
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "$srcdir/gmusicproxy.service" \
		"$pkgdir/usr/lib/systemd/system/gmusicproxy.service"

	install -Dm644 "$srcdir/$pkgname.service" \
		"$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm755 "$srcdir/$pkgname.sysuser" \
		"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.tmpfiles" \
		"$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

md5sums=('4225479932648ca186f35ba3d41509be'
         'dcb085039110ab6a87e944865a4fccdb'
         'f7c765324710c59738db0b8a9c124982'
         'da20784900831708c51edb58778f61cd')
