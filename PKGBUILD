# Maintainer: DrRac27 <drrac27 at riseup.net>

pkgname=moment
pkgver=0.7.4
pkgrel=2
pkgdesc='A customizable, keyboard-operable Matrix client. Fork of Mirage'
arch=('x86_64' 'i686' 'aarch64')
url='https://mx-moment.xyz/'
license=('LGPL3')
depends=(
	'qt5-base'
	'qt5-declarative'
	'qt5-quickcontrols2'
	'qt5-svg'
	'qt5-graphicaleffects'
	'qt5-imageformats'
	'python'
	'python-pyotherside'
	'libolm'
	'libjpeg-turbo'
	'zlib'
	'libtiff'
	'libwebp'
	'openjpeg2'
	'libmediainfo'
	'python-pillow'
	'python-pymediainfo'
	'python-cairosvg'
	'python-aiofiles'
	'python-appdirs'
	'python-filetype'
	'python-html-sanitizer'
	'python-lxml'
	'python-mistune>=2'
	'python-matrix-nio'
	'libxss'
	'python-plyer'
	'python-sortedcontainers'
	'python-watchgod'
	'python-redbaron'
	'dbus-python'
	'python-emoji'
	'python-hsluv'
	'python-pycryptodome'
	'python-simpleaudio'
	'python-olm'
	'python-cachetools'
	'python-atomicwrites'
	'python-peewee'
)
makedepends=('cmake' 'git')
conflicts=("${pkgname}-git")
source=('git+https://gitlab.com/mx-moment/moment.git' 'fix-html-sanitizer.patch')
sha256sums=('SKIP' 'a5c65370bbd40810a2f0053917072f2cdf17a563de50a5d6f2cf7c9ee30fbcc5')

prepare() {
	cd "${srcdir}/${pkgname}"
	git checkout "v${pkgver}"
	git submodule update --init --recursive
	patch -p1 < "${srcdir}/fix-html-sanitizer.patch"
}

build() {
	cd "${srcdir}/${pkgname}"
	make clean || true
	qmake PREFIX=/usr moment.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT="${pkgdir}" install
}
