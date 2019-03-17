# Maintainer: robertfoster
# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

pkgname=gmusicproxy
pkgver=1.0.8.1
pkgrel=1
pkgdesc="Stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/diraimondo/gmusicproxy"
license=('GPL')
depends=('python-gmusicapi' 'python-netifaces' 'python-xdg' 'python-eyed3' 'python-daemon')
optdepends=('python-keyring: keyring support')
makedepends=('python-setuptools')
source=("https://github.com/M0Rf30/gmusicproxy/archive/v${pkgver}.tar.gz"
	"$pkgname.cfg.sample"
	"$pkgname.user.service"
	"$pkgname.system.service"
)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "${srcdir}"/gmusicproxy.cfg.sample \
		"${pkgdir}"/etc/gmusicproxy.cfg.sample

	install -Dm644 "${srcdir}"/gmusicproxy.system.service \
		"${pkgdir}"/usr/lib/systemd/system/gmusicproxy.service

	install -Dm644 "${srcdir}"/gmusicproxy.user.service \
		"${pkgdir}"/usr/lib/systemd/user/gmusicproxy.service

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP'
	'e03e8f0937997fd8e86f60c3c28d1d26'
	'c7a497a0cb00a3a81c9199a69dc53472'
'3867da4b9d6c27f10cfb725dcdd9a7b9')
