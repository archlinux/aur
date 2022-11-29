# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('chat-downloader-git')
_gitname=('chat-downloader')
pkgver=0.2.0a.r2.g657e56e
pkgrel=1
pkgdesc="Retrieve chat messages from livestreams, videos, clips and past broadcasts. (YouTube, Twitch, etc.) No authentication needed!"
url="https://github.com/xenova/chat-downloader"
license=('MIT')
source=('git+https://github.com/xenova/chat-downloader.git')
b2sums=('SKIP')
arch=('any')
depends=('python' 'python-requests' 'python-isodate' 'python-docstring-parser' 'python-colorlog' 'python-websocket-client')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-sphinxcontrib-programoutput')
checkdepends=('python-pytest')
provides=('chat-downloader')
conflicts=('chat-downloader')

pkgver(){
	cd "${_gitname}"
 	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${_gitname}"
	python setup.py build
}

check(){
	cd "${_gitname}"
	pytest
}

package(){
	cd "${_gitname}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
