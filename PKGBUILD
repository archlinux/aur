# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Grafcube <grafcube at disroot dot org>

_anki=anki
_aqt=aqt
_py=cp39

pkgname=anki-bin
pkgver=2.1.50
pkgrel=2
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
)
makedepends=(
	'python-pip'
)
optdepends=(
	'lame: record sound'
	'mpv: play sound. prefered over mplayer'
	'mplayer: play sound'
)
provides=(anki=$pkgver)
conflicts=(anki)
source=(
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki-$pkgver-$_py-abi3-manylinux_2_28_$arch.whl"
	"https://files.pythonhosted.org/packages/py3/${_aqt::1}/$_aqt/$_aqt-$pkgver-py3-none-any.whl"
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/runanki.py"
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.desktop"
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.png"
)
noextract=("${source[@]##*/}")
sha256sums=('0f1dbcaf89a7584e6ebef848a7abad6f008f4be882d634bc245a0e2bddfc18c6'
            '5b2d10e940dbc82c584bb9cb5657ad70a9bdfebb70bc82f4b1f90052184d6355'
            '9648e7e915f51f08e05c48ef5f39b4015922fe1cf3d7f2895535ef10ef4507ae'
            '53db2e5bfeb00aa249667e09466a34bfacb17b61097875a8cdd93ee1a9380b9a'
            '97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

	install -Dm755 runanki.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki.png "$pkgdir/usr/share/pixmaps/anki.png"
}
