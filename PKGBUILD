# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

pkgname=gmusicproxy
pkgver=1.0.8
pkgrel=2
pkgdesc="Stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/diraimondo/gmusicproxy"
license=('GPL')
depends=('python2-gmusicapi>=10.1.0' 'python2-netifaces>=0.10.4' 'python2-xdg>=0.25' 'python2-eyed3>=0.7.8' 'python2-daemon>=2.0.5')
optdepends=('python2-keyring: keyring support')
makedepends=('python2-setuptools')
source=("https://github.com/diraimondo/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname.cfg.sample"
	"$pkgname.user.service"
	"$pkgname.system.service"
)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "${srcdir}"/gmusicproxy.cfg.sample \
		"${pkgdir}"/etc/gmusicproxy.cfg.sample

	install -Dm644 "${srcdir}"/gmusicproxy.system.service \
		"${pkgdir}"/usr/lib/systemd/system/gmusicproxy.service

	install -Dm644 "${srcdir}"/gmusicproxy.user.service \
		"${pkgdir}"/usr/lib/systemd/user/gmusicproxy.service

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('e7eea6f20b26ef64b4f3b5fa9237b3c4'
	'e03e8f0937997fd8e86f60c3c28d1d26'
	'c7a497a0cb00a3a81c9199a69dc53472'
'3867da4b9d6c27f10cfb725dcdd9a7b9')
