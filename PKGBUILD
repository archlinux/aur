# Maintainer nfnty <arch at nfnty dot se>
# Maintainer evorster <evorster at gmail dot com>

pkgname=('mlt-git')
_srcname='mlt'
pkgdesc='Multimedia Framework'
pkgver=r5828.1651704493.928be576 
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/mltframework/${_srcname}" license=('GPL2')
depends=( 	'libsamplerate'
		'sox'
		'ffmpeg'
		'vid.stab'
		'rtaudio'
		'libebur128'
		'opencv'
		'movit'
		'rubberband'
		'qt5-svg'
		'gdk-pixbuf2'
		'sdl12-compat'
		)

makedepends=( 	'ladspa'
                'frei0r-plugins'
		'sdl_image'
		'gtk2'
		'libdv'
		'sox'
		'libexif'
		'python2'
		'swig'
		'git'
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
