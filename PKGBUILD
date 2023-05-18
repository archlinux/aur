# Maintainer: David Grimm < david[dot]grimm [replace this with the swirly a sign] vegri[dot]net >
pkgname=ov-client
pkgver="0.20.452"
pkgrel=1
epoch=
pkgdesc="Client to share and receive spatial realtime Audio"
arch=('x86_64'
	  'arm64'
	  'armhf'
	  'aarch64'
	 )
url="https://ovbox.de"
license=('GPL')
groups=()
depends=('jack2'
		 'liblo'
		 'libsndfile'
		 'fftw'
		 'gsl'
		 'gtkmm3'
		 'gtk3'
		 'cairomm'
		 'hicolor-icon-theme'
		 'xerces-c'
		 'curl'
		 'bash'
		 'glibmm'
		 'atkmm'
		 'libsamplerate'
		 'libsigc++'
		 'alsa-lib'
		 'gcc-libs'
		 'glibmm'
		 'glibc'
		 'glib2'
		)
makedepends=('git'
			 'make'
			 'gcc'
			 'pkg-config'
			 'eigen'
			 'boost'
			 'libxml++2.6')
checkdepends=()
optdepends=('node-js: Web Mixer')
provides=('ov-client'
		  'ovbox')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
b2sums=()
validpgpkeys=()

prepare() {
	if [ "$(ls ov-client)" == "" ]
	then
		git clone https://github.com/gisogrimm/ov-client.git
	else
		cd ov-client
		git checkout development
		git pull
		cd ..
	fi
	cd ov-client
	git checkout -q 05502ee32a1a9c80fe3cc0e57ba631d30f5cef0c
	git submodule update --init --recursive
}

build() {
	cd ov-client
	make -j
	rm build/*.*
}

# cmake fails to detect a working c++ compiler and
#check() {
#	cd ov-client
#	make libtest
#}

package() {
	cd ov-client
	make PREFIX="${pkgdir}/usr" install
}
