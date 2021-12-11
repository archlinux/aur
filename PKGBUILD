# Maintainer: Ethan Djeric <ethan@ethandjeric.com> 
pkgname=jellyshuf
pkgver=0.3.0
pkgrel=1
license=("MIT" "Apache")
arch=('any')
pkgdesc="Randomly add items to mpd queue from jellyfin (use in tandem with mopidy-jellyfin)"
url="https://github.com/deafmute1/jellyshuf"
makedepends=("python-setuptools")
depends=(
	"python"
	"python-requests"
	"python-appdirs"
	"python-musicpd"
	"python-keyring"
	"dbus-python"
)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
optdepends=(
	"mopidy: to enable access to jellyfin music files via a local MPD server" 
	"mopidy-jellyfin: to enable access to jellyfin music files via a local MPD server" 
	"mopidy-mpd: to enable access to jellyfin music files via a local MPD server"
)
sha256sums=('0719a321578edd2b8d54145e8f1ddd58037be3050a801b70e888f713bcad6227')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


