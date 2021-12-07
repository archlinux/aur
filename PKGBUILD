pkgname=jellyshuf
pkgver=0.1.1
pkgrel=1
license=("MIT" "Apache")
arch=('any')
pkgdesc="Randomly add items to mpd queue from jellyfin (use in tandem with mopidy-jellyfin)"
url="https://github.com/deafmute1/jellyshuf"
makedepends=("python-setuptools")
depends=(
	"python-requests"
	"python-appdirs"
	"python-musicpd"
)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
optdepends=(
	"mopidy: to enable access to jellyfin music files via a local MPD server" 
	"mopidy-jellyfin: to enable access to jellyfin music files via a local MPD server" 
	"mopidy: to enable access jellyfin music files via a local MPD server"
)
sha256sums=('a10cf873050cafe51c1ec3d646c45f9d6485e02efb1bc5a784821c92023053ff')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
