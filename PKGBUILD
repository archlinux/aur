# Contributor: masmu
# Contributor: Cygn
# Maintainer: pika02 <pikakolendo02 ät gmail döt com>

pkgname=pulseaudio-dlna-cygn
pkgver=0.6.1
pkgrel=2
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio, Cygn edition'
arch=('x86_64')
url=https://github.com/Cygn/pulseaudio-dlna/
license=('GPL3')
provides=('pulseaudio-dlna')
depends=('python-chardet' 'python-dbus' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-protobuf' 'python-setuptools'
         'python-zeroconf' 'python-urllib3' 'python-virtualenv')
makedepends=('help2man')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Cygn/pulseaudio-dlna/archive/${pkgver}.tar.gz")
sha256sums=('497743700377389ae03ffae2d8fbf8c49ed8ec219d53fd8ca7f0aea0d464b15d')

prepare() {
  mv "pulseaudio-dlna-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
#   sed -i '/dbus-python/d' setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  make manpage
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

