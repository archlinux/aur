# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Grafcube <grafcube at protonmail dot com>

_anki=anki
_aqt=aqt
_py=cp38

pkgname=anki-bin
pkgver=2.1.48
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
	'python-pyqt5'
	'python-pyqtwebengine'
	'python-send2trash'
	'python-waitress'

	# anki
	'python-decorator'
	'python-distro'
	'python-markdown'
	'python-orjson'
	'python-protobuf'
	'python-stringcase'

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
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki-$pkgver-$_py-abi3-manylinux2014_$arch.whl"
	"https://files.pythonhosted.org/packages/py3/${_aqt::1}/$_aqt/$_aqt-$pkgver-py3-none-any.whl"
	"https://raw.githubusercontent.com/ankitects/anki/2.1.48/qt/runanki.py"
	"https://raw.githubusercontent.com/ankitects/anki/2.1.48/qt/linux/anki.desktop"
	"https://raw.githubusercontent.com/ankitects/anki/2.1.48/qt/linux/anki.png"
)
noextract=("${source[@]##*/}")
sha256sums=('7611846cc73eceda888f342e5b6f70fb3dc651505095b6a2de42001b5b2c6d93'
            'f6171546bd09097a428acc9e50a878ccfca9176eafa09bb628a8407aa227af75'
            '520225521a013546c521c2c8d60db3d03d7fceb6126fa61b8a70e1d2c398e4a4'
            '5121f5877cd6fe15e262317eb2ac08a01f7039e3fd5d85e3193b4b0ff7974e13'
            '97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

	install -Dm755 runanki.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki.png "$pkgdir/usr/share/pixmaps/anki.png"
}
