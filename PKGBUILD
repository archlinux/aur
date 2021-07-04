# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>
# Contributor: pika02 <pikakolendo02 ät gmail döt com>

pkgname=pulseaudio-dlna-python3
pkgver=0.6.1
pkgrel=1
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio, Python 3 edition'
arch=('x86_64')
url=https://github.com/Cygn/pulseaudio-dlna/
license=('GPL3')
depends=('python-chardet' 'python-dbus' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-protobuf' 'python-setuptools'
         'python-zeroconf' 'python-urllib3' 'python-virtualenv')
makedepends=('git' 'help2man')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=('https://github.com/Cygn/pulseaudio-dlna/archive/0.6.1.tar.gz')
sha256sums=('497743700377389ae03ffae2d8fbf8c49ed8ec219d53fd8ca7f0aea0d464b15d')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/dbus-python/d' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  make manpage
  python setup.py build --build-lib=build/python \
                  install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
