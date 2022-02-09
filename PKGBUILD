# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Grafcube <grafcube at disroot dot com>

_anki=anki
_aqt=aqt
_py=cp38

pkgname=anki-bin
pkgver=2.1.49
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
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/runanki.py"
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/linux/anki.desktop"
	"https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/linux/anki.png"
)
noextract=("${source[@]##*/}")
sha256sums=('746c9807d5f2f87503eb993b28b660fd8e0bc70b969796855dbd48bdaa995af4'
            'e9aee6a19ab4f4cf7142f4ccf776a34245013d2800d873177854b0ec5dfb2411'
            '520225521a013546c521c2c8d60db3d03d7fceb6126fa61b8a70e1d2c398e4a4'
            '5121f5877cd6fe15e262317eb2ac08a01f7039e3fd5d85e3193b4b0ff7974e13'
            '97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

	install -Dm755 runanki.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki.png "$pkgdir/usr/share/pixmaps/anki.png"
}
