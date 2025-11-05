# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh



pkgname=kdenlive-git
pkgver=25.11.70.r22889
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework. KF5 Frameworks (Latest Applications GIT Version)"
arch=('i686' 'x86_64')
url="http://www.kdenlive.org/"
license=('GPL-2.0-or-later')
depends=( 'kfilemetadata' 'knewstuff' 'knotifyconfig' 'doxygen' 'ktextwidgets' 'qt6-multimedia'
	  'mlt' 'hicolor-icon-theme' 'purpose' 'qt6-networkauth' 'python' 'imath' 'opentimelineio'
	  'kddockwidgets-qt6' 'python-requests' 'python-pillow' 'python-omegaconf' 
	  'python-hydra-core' 'python-numpy' 'ffmpeg'
	)
makedepends=('extra-cmake-modules' 'kdoctools5' 'git' 'v4l-utils' 'qt6-tools')
optdepends=(
            'cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview'
	    'perl-image-exiftool: for exif information'
	    'mediainfo: for exif information'
	    'oxygen-icons: optional for xfce'
	    'breeze-icons: optional for default theme'
	    'python-setuptools: for python modules'
	    'python-opencv-cuda: for motion tracking'
	    'python-sam2-git: for background removal'
            'python-srt: for subtitle formatting'
	    'python-openai-whisper: for ai speech to text'
            'python-pytorch-cuda: for AI speech to text'
	    'python-vosk-bin: open source speech recognition')
provides=('kdenlive' )
conflicts=('kdenlive')
source=('git+https://invent.kde.org/multimedia/kdenlive')
sha1sums=('SKIP')
#options=(debug !strip)

pkgver() {
  cd ${srcdir}/kdenlive
  _ver="$(cat CMakeLists.txt | grep RELEASE_SERVICE_VERSION | cut -d '"' -f2 | tr '\n' '.' | cut -d "." -f 1-3)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD)"
}

#To get debug info, change -DCMAKE_BUILD_TYPE=Release to either "Debug" or "RelWithDebInfo"

build() {
  cmake -B build -S kdenlive \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON	\
    -DFETCH_OTIO=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

