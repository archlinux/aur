# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Grafcube <grafcube at disroot dot org>

_anki=anki
_aqt=aqt
_py=cp39

pkgname=anki-bin
pkgver=23.12.1
pkgrel=1
pkgdesc='Helps you remember facts (like words/phrases in a foreign language) efficiently.
Installed with wheel.'
arch=('x86_64')
url='https://apps.ankiweb.net/'
license=('AGPL3')
depends=(
	# anki and aqt
	'python-beautifulsoup4'
	'python-requests'

	# aqt
	'python-flask'
	'python-flask-cors'
	'python-jsonschema'
	'python-pyqt6'
	'python-pyqt6-webengine'
	'python-send2trash'
	'python-waitress'

	# anki
	'python-decorator'
	'python-distro'
	'python-markdown'
	'python-orjson'
	'python-protobuf'

	# requests
	'python-pysocks'

	# pyqt6
	'qt6-svg'
)
makedepends=(
	'python-installer'
)
optdepends=(
	'lame: record sound'
	'mpv: play sound. prefered over mplayer'
	'mplayer: play sound'
)
provides=(anki=$pkgver)
conflicts=(anki)
_anki_whl="$_anki-$pkgver-$_py-abi3-manylinux_2_28_$arch.whl"
_aqt_whl="$_aqt-$pkgver-py3-none-any.whl"
source=(
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki_whl"
	"https://files.pythonhosted.org/packages/py3/${_aqt::1}/$_aqt/$_aqt_whl"
	"runanki-$pkgver.py::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/runanki.py"
	"anki-$pkgver.1::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.1"
	"anki-$pkgver.desktop::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.desktop"
	"anki-$pkgver.png::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.png"
	"anki-$pkgver.xml::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.xml"
	"anki-$pkgver.xpm::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.xpm"
)
noextract=("${source[@]##*/}")
sha256sums=('d9676c1595c28d335ef5dc1e60e5eb624f4f1e948a5344dde43374bfd8a98b29'
            '2e961cf3ba133b45bca3361c5757dd6c9ed719b642b821b5b1986c28e9bbfaeb'
            '9648e7e915f51f08e05c48ef5f39b4015922fe1cf3d7f2895535ef10ef4507ae'
            '8b9fec8fdf2897b4722f8cee169e9fb1e46cee90d3fb03ee12587e30c2f5dad7'
            '53db2e5bfeb00aa249667e09466a34bfacb17b61097875a8cdd93ee1a9380b9a'
            '97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a'
            '2845a528fb3a064b67404a03d72bfaba9b421cb220b25228b815946c6553ce38'
            'd814c62e38246b6e4ba73ee037647a29675925167518137f05a8f9e60c258b6e')

package() {
	python -m installer --destdir="$pkgdir" $_anki_whl
	python -m installer --destdir="$pkgdir" $_aqt_whl

	install -Dm755 runanki-$pkgver.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki-$pkgver.1 "$pkgdir/usr/share/man/man1/anki.1"
	install -Dm644 anki-$pkgver.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki-$pkgver.png "$pkgdir/usr/share/pixmaps/anki.png"
	install -Dm644 anki-$pkgver.xml "$pkgdir/usr/share/mime/packages/anki.xml"
	install -Dm644 anki-$pkgver.xpm "$pkgdir/usr/share/pixmaps/anki.xpm"
}
