# Maintainer nfnty <arch at nfnty dot se>
# Maintainer evorster <evorster at gmail dot com>

pkgname=('mlt-git')
_srcname='mlt'
pkgdesc='Multimedia Framework'
pkgver=r5645.1621198199.afc1ae47 
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/mltframework/${_srcname}" license=('GPL2')
optdepends=( 	'sdl_image: for SDL plugin'
		'libsamplerate: for libavresample plugin'
		'sox: for SOX (Audio Swiss Army Knife) plugin'
		'ffmpeg: for ffmpeg plugin'
		'vid.stab: for video stabilize plugin'
		'gtk2: Gtk plugin' 'qt5-svg: for Qt5 plugins'
		'jack: for JACK sound output plugin'
		'libexif: for auto rotate plugin'
		'frei0r-plugins: for additional effects'
		'movit: opengl plugin'
		)

makedepends=( 	'ladspa'
		'frei0r-plugins'
		'libdv'
		'sdl_image'
		'libsamplerate'
		'sox'
		'ffmpeg'
		'vid.stab'
		'qt5-svg'
		'jack'
		'libexif'
		'python2'
		'swig'
		'git'
		'movit'
		)

provides=("${pkgname[0]%-git}") conflicts=("${pkgname[0]%-git}")
source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')
pkgver(){ 	cd "${srcdir}/${_srcname}"
		printf 'r%s.%s.%s\n' \
		"$( git rev-list --count 'HEAD' )" \
    		"$( git log --max-count='1' --pretty='format:%ct' )" \
    		"$( git rev-parse --short 'HEAD' )"
		}

prepare(){ 	echo "Prepare"
		}

build(){ 	rm -rf build
		mkdir -p build
		cd build
		cmake "../mlt"\
		  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		  -DCMAKE_INSTALL_PREFIX=/usr \
		  -DMOD_OPENCV=ON \
		  -DMOD_MOVIT=ON
		make
		}

package(){ 	cd build 
		make DESTDIR="${pkgdir}" install 
		}
