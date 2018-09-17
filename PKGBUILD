# Maintainer: teraflops < cprieto.ortiz@gmail.com >
# Packager: teraflops < cprieto.ortiz@gmail.com >

pkgname=google-music-manager-git
_gitname=google-music-manager
pkgver=1.2.3
pkgrel=1
pkgdesc="Google Music Manager - Python Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager"
license=('MIT')
depends=('python-netifaces' 'python-watchdog' 'python-gmusicapi-git' 'python-beautifulsoup4' )
makedepends=('python-setuptools' 'git')
provides=('google-music-manager')
conflicts=('google-music-manager')
source=("google-music-manager::git+https://github.com/jaymoulin/google-music-manager.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/$_gitname"
 	    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_gitname}/auth"
	    python setup.py install --root="$pkgdir" --optimize=1
	cd "${srcdir}/${_gitname}/downloader"
            python setup.py install --root="$pkgdir" --optimize=1
	cd "${srcdir}/${_gitname}/uploader"
            python setup.py install --root="$pkgdir" --optimize=1
}
