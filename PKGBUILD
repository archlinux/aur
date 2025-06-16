# Maintainer: Jay Chu <tothesong at gmail dot com>
# Maintainer: Berrit Birkner <aur at bbirkner dot de>
# Contributor: Grafcube <grafcube at disroot dot org>

_anki=anki
_aqt=aqt
_py=cp39

pkgname=anki-bin
pkgver=25.02.7
pkgrel=1
pkgdesc='Helps you remember facts (like words/phrases in a foreign language) efficiently.
Installed with wheel.'
arch=('x86_64' 'aarch64')
url='https://apps.ankiweb.net/'
license=('AGPL-3.0-or-later' '0BSD' 'MIT' 'BSD-3-Clause' 'Apache-2.0' 'GPL-3.0-or-later' 'CC-BY-4.0')
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
_anki_whl_x86_64="$_anki-$pkgver-$_py-abi3-manylinux_2_35_x86_64.whl"
_anki_whl_aarch64="$_anki-$pkgver-$_py-abi3-manylinux_2_35_aarch64.whl"
_aqt_whl="$_aqt-$pkgver-py3-none-any.whl"
source=(
	"https://files.pythonhosted.org/packages/py3/${_aqt::1}/$_aqt/$_aqt_whl"
	"runanki-$pkgver.py::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/runanki.py"
	"anki-$pkgver.1::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.1"
	"anki-$pkgver.desktop::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.desktop"
	"anki-$pkgver.png::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.png"
	"anki-$pkgver.xml::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.xml"
	"anki-$pkgver.xpm::https://raw.githubusercontent.com/ankitects/anki/$pkgver/qt/bundle/lin/anki.xpm"
)
source_x86_64=(
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki_whl_x86_64"
)
source_aarch64=(
	"https://files.pythonhosted.org/packages/$_py/${_anki::1}/$_anki/$_anki_whl_aarch64"
)
noextract=("${source[@]##*/}")
sha256sums=('da45e9073c76570ddce25e0d3a27cf44b0fbe3b244c1bdaf64524556af4f39d6'
            '9648e7e915f51f08e05c48ef5f39b4015922fe1cf3d7f2895535ef10ef4507ae'
            '8b9fec8fdf2897b4722f8cee169e9fb1e46cee90d3fb03ee12587e30c2f5dad7'
            '3829ce614aaea9eb1e57abf4c269647cc87ccc6d4755c3b2563ce44e30992ae2'
            '97ad2134ef1a7686789c7becd8bd05dd8693cf0d3127951ca6ba7b29a80b402a'
            '2845a528fb3a064b67404a03d72bfaba9b421cb220b25228b815946c6553ce38'
            'd814c62e38246b6e4ba73ee037647a29675925167518137f05a8f9e60c258b6e')
sha256sums_x86_64=('ae979f157527d2a2a9c77ffa38fd015e43f067c04e43e111c99fa2cf35612e5d')
sha256sums_aarch64=('8cd97678bfe46509629e23d9906211c4a605f1d5ab30a3b08aa28bacb8fc09e3')


package() {
	python -m installer --destdir="$pkgdir" $(eval echo "\${_anki_whl_$CARCH}")
	python -m installer --destdir="$pkgdir" $_aqt_whl

	install -Dm755 runanki-$pkgver.py "$pkgdir/usr/bin/anki"
	install -Dm644 anki-$pkgver.1 "$pkgdir/usr/share/man/man1/anki.1"
	install -Dm644 anki-$pkgver.desktop "$pkgdir/usr/share/applications/anki.desktop"
	install -Dm644 anki-$pkgver.png "$pkgdir/usr/share/pixmaps/anki.png"
	install -Dm644 anki-$pkgver.xml "$pkgdir/usr/share/mime/packages/anki.xml"
	install -Dm644 anki-$pkgver.xpm "$pkgdir/usr/share/pixmaps/anki.xpm"
}
