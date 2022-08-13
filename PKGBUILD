# Maintainer: SZanko, szanko at protonmail dot com

pkgname=jakym
pkgver=0.4.1
pkgrel=2
pkgdesc="JAKYM, Just Another Konsole YouTube-Music. A command line based Youtube music player written in Python with both Spotify and Youtube playlist support and easy on memory."
arch=('any')
url="https://github.com/themayankjha/JAKYM"
license=('GPL3')
makedepends=(
	'python-build'
	'python-installer'
)
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	'ffmpeg'
	'youtube-dl'
	'python-pyfiglet'
	'python-pydub'
	'python-termcolor'
	'python-beautifulsoup4'
	'python-colorama'
	'python-lxml'
	'python-simpleaudio'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('86379ac0742db450e7255481db43ed5559fba6a4a6f1ae7e97c74a62d0639b52')

build() {
	cd "${srcdir}/${pkgname^^}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check 
}

package() {
    cd "${srcdir}/${pkgname^^}-${pkgver}"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
