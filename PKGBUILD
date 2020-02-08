# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=gmusicproxy-git
_gitname=gmusicproxy
pkgver=1.0.11
pkgrel=1
pkgdesc="Let's stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/M0Rf30/gmusicproxy"
license=('GPL3')
depends=('python-netifaces' 'python-xdg' 'python-eyed3' 'python-daemon' 'python-gmusicapi' 'python-gpsoauth')
makedepends=('python-setuptools')
provides=('gmusicproxy')
conflicts=('gmusicproxy' 'gmusicproxy-stable')
source=("gmusicproxy::git+https://github.com/M0Rf30/gmusicproxy.git"
'gmusicproxy.cfg.sample' 'gmusicproxy.user.service' 'gmusicproxy.system.service'
'gmusicproxy.install')
sha256sums=('SKIP'
'e69f5e5fff155917621ee65d91adf943d3d133e1d771578d7176ba3649f01363'
'b575dcd3f2aa734718b6d3dbd487c5a7ec3ff946c4532e1d9b3fe5e8461b88b9'
'35b09e3873980df0bdd37baa6694c1b219b24a7f3550a5630f453381976d0f48'
)
install="gmusicproxy.install"

pkgver() {
	cd "$srcdir/$_gitname"
 	git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_gitname}"
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "${srcdir}"/gmusicproxy.cfg.sample \
		"${pkgdir}"/etc/gmusicproxy.cfg.sample
	install -Dm644 "${srcdir}"/gmusicproxy.system.service \
		"${pkgdir}"/usr/lib/systemd/system/gmusicproxy.service
	install -Dm644 "${srcdir}"/gmusicproxy.user.service \
		"${pkgdir}"/usr/lib/systemd/user/gmusicproxy.service
        install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/gmusicproxy/LICENSE.md"
}
