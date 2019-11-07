# Maintainer: danieltetraquark
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna-aharter-python3-git
_pkgname=pulseaudio-dlna-aharter-python3
pkgver=r732.e7357dc
pkgrel=2
provides=('pulseaudio-dlna')
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio'
arch=('x86_64')
url=https://github.com/aharter/pulseaudio-dlna
license=('GPL3')
depends=('python-docopt' 'python-dbus' 'python-requests' 'python-setproctitle' 'python-notify2' 'python-psutil' 'python-chardet' 'python-netifaces' 'python-lxml' 'python-pychromecast' 'python-dbus'
'pygobject-devel'  'python-pyroute2')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=(
	"${_pkgname}::git+$url#branch=python3"
	"removedbus.patch"
)
sha256sums=(
	'SKIP'
	'be378effc87757e30f684c129d4eead61add4ba8c1355fb411e2e417ad5bb213' # removedbus.patch
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/removedbus.patch"
  python setup.py build
}
package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

