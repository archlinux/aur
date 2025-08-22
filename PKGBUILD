# Maintainer: SClause <arch at sclause dot net>
_pkgname=grandorgue
pkgname="$_pkgname"
_version=3.16.0
_build=1
pkgver="${_version}.${_build}"
pkgrel=1
pkgdesc="Virtual Pipe Organ Software"
arch=('i686' 'x86_64')
url="https://github.com/GrandOrgue/$_pkgname"
license=('GPL-2.0-or-later')
depends=(wxwidgets-gtk3 wavpack fftw jack rtmidi rtaudio portaudio zita-convolver yaml-cpp)
makedepends=(git cmake docbook-xsl imagemagick inkscape)
conflicts=(grandorgue-git grandorgue-bin)
source=("git+$url.git#tag=${_version}-${_build}")
sha256sums=('SKIP')
options=(!debug)

build() {
	cd "$_pkgname"
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DUSE_INTERNAL_RTAUDIO=Off -DUSE_INTERNAL_PORTAUDIO=Off -DUSE_INTERNAL_ZITACONVOLVER=Off -DBUILD_VERSION=${_build}
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
