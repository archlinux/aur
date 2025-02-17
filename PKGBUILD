# Maintainer: DrRac27 <drrac27 at riseup.net>

pkgname=moment-git
_name=moment
pkgver=v0.7.5.r21.c776386a
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
	'python-pyotherside>=1.6.2'
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
	'python-lxml-html-clean'
	'python-mistune>=2'
	'python-matrix-nio'
	'libxss'
	'python-plyer'
	'python-sortedcontainers'
	'python-watchfiles'
	'python-redbaron'
	'dbus-python'
	'python-emoji'
	'python-hsluv'
	'python-pycryptodome'
	'python-pyaudio'
	'python-olm'
	'python-cachetools'
	'python-atomicwrites'
	'python-peewee'
)
makedepends=('cmake' 'git')
provides=('moment')
conflicts=('moment')
source=('git+https://gitlab.com/mx-moment/moment.git')
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_name}"
	git submodule update --init --recursive
}

pkgver() {
	cd "${srcdir}/${_name}"
	local tag=$(git tag --sort=-v:refname | head -1)
	local commits_since=$(git rev-list $tag..HEAD --count)
	echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
	cd "${srcdir}/${_name}"
	make clean || true
	qmake PREFIX=/usr moment.pro
	make
}

package() {
	cd "${srcdir}/${_name}"
	make INSTALL_ROOT="${pkgdir}" install
}
