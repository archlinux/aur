# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna-python3-git
pkgver=0.5.2.r152.gb0db813
pkgrel=1
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio'
arch=('x86_64')
url=https://github.com/masmu/pulseaudio-dlna
license=('GPL3')
depends=('python-chardet' 'python-dbus' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-setuptools')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=("git+$url.git#branch=python3")
sha512sums=('SKIP')

pkgver() {
  cd pulseaudio-dlna
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pulseaudio-dlna
  sed -i '/dbus-python/d' setup.py
}

build() {
  cd pulseaudio-dlna
  python setup.py build
}

package() {
  cd pulseaudio-dlna
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
