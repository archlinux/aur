# Maintainer: Ben Brown <benjamb at pm dot me>

pkgname=mkchromecast-git
_gitname=mkchromecast
pkgver=0.3.8.1.r165.g0de9fd78
pkgrel=3
pkgdesc="Cast Audio/Video to your Google Cast and Sonos Devices"
arch=('any')
url="https://mkchromecast.com"
license=('MIT')
depends=('faac' 'flac' 'lame' 'python-flask' 'python-gobject' 'python-netifaces'
         'python-psutil' 'python-pychromecast')
makedepends=('git' 'python-setuptools')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend and/or to cast with ALSA'
            'gstreamer: for gstreamer backend'
            'nodejs: for node backend'
            'opus-tools: for Opus content with parec/gstreamer'
            'pavucontrol: to cast with PulseAudio'
            'pulseaudio: to cast with PulseAudio'
            'python-pyqt5: for system tray menu support'
            'python-soco: to cast to Sonos devices'
            'sox: for WAV content with parec/gstreamer'
            'vorbis-tools: for Ogg content with parec/gstreamer'
            'youtube-dl: for streaming from YouTube')
provides=('mkchromecast')
conflicts=('mkchromecast')
source=("git+https://github.com/muammar/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

build() {
  cd "${_gitname}"
  python setup.py build
}

package() {
  cd "${_gitname}"
  python setup.py install --root="$pkgdir"

  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "images/${_gitname}.xpm"
}
