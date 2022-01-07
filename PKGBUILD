# Maintainer: Nafis <mnabid.25@outlook.com>

pkgname=animdl-git
_pkgname=${pkgname%-git}
pkgver=1.4.35
pkgrel=2
pkgdesc="A highly efficient anime downloader and streamer"
arch=('any')
url="https://github.com/justfoolingaround/animdl"
license=('custom:Unlicensed')
depends=('anitopy' 'python' 'python-click' 'python-cssselect' 'python-httpx' 'python-lxml' 'python-pycryptodomex' 'python-regex' 'python-requests' 'python-setuptools' 'python-tqdm' 'python-yaml' 'python-yarl')
makedepends=('git')
optdepends=(
	'mpv: stream anime'
	'vlc: stream anime'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}/${_pkgname}/core
	printf "%s.r%s.%s" \
		"$(grep -o '[0-9.]\+' __version__.py)" \
		"$(git log --oneline HEAD ^$(git rev-list -1 HEAD __version__.py) | wc -l)" \
		"$(git rev-parse --short HEAD)" \
		| sed "s/\.r0\..\+//"
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root=${pkgdir}
}
