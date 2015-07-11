# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=gmusicproxy
_gitname=gmusicproxy
pkgver=0.9.8.r6.g8fec2d8
pkgrel=1
pkgdesc="Let's stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/diraimondo/gmusicproxy"
license=('GPL3')
depends=('python2' 'python2-netifaces' 'python2-xdg' 'python2-eyed3' 'python2-daemon' 'python2-requests' 'python2-gmusicapi' 'python2-certifi' 'python2-gpsoauth')
makedepends=('python2-setuptools' 'git')
provides=('gmusicproxy')
source=("gmusicproxy::git+https://github.com/diraimondo/gmusicproxy.git"
'gmusicproxy.cfg.sample' 'gmusicproxy.user.service' 'gmusicproxy.system.service') 
sha256sums=('SKIP'
	'e69f5e5fff155917621ee65d91adf943d3d133e1d771578d7176ba3649f01363'
'b575dcd3f2aa734718b6d3dbd487c5a7ec3ff946c4532e1d9b3fe5e8461b88b9'	
'35b09e3873980df0bdd37baa6694c1b219b24a7f3550a5630f453381976d0f48')
install=gmusicproxy.install
pkgver() {
	cd "$srcdir/$_gitname"
 	git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_gitname}"
	python2 setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 "${srcdir}"/gmusicproxy.cfg.sample \
		"${pkgdir}"/etc/gmusicproxy.cfg.sample

	install -Dm644 "${srcdir}"/gmusicproxy.system.service \
		"${pkgdir}"/usr/lib/systemd/system/gmusicproxy.service

	install -Dm644 "${srcdir}"/gmusicproxy.user.service \
		"${pkgdir}"/usr/lib/systemd/user/gmusicproxy.service
}
