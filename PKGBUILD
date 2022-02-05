# Maintainer: Ben Brown <benjamb at pm dot me>

pkgname=mkchromecast-git
_gitname=mkchromecast
pkgver=r1173.2731d8d1
pkgrel=2
pkgdesc="Cast Audio/Video to your Google Cast and Sonos Devices"
arch=('any')
url="https://mkchromecast.com"
license=('MIT')
depends=('faac' 'flac' 'lame' 'python-flask' 'python-gobject' 'python-netifaces'
         'python-psutil')
makedepends=('git' 'python-setuptools')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend and/or to cast with ALSA'
            'gstreamer: for gstreamer backend'
            'nodejs: for node backend'
            'opus-tools: for Opus content with parec/gstreamer'
            'pavucontrol: to cast with PulseAudio'
            'pulseaudio: to cast with PulseAudio'
            'python-pyqt5: for system tray menu support'
            'python-pychromecast-git: to cast to Chromecast devices'
            'python-soco: to cast to Sonos devices'
            'sox: for WAV content with parec/gstreamer'
            'vorbis-tools: for Ogg content with parec/gstreamer'
            'youtube-dl: for streaming from YouTube')
provides=('mkchromecast')
conflicts=('mkchromecast')
options=('!emptydirs')
source=("git+https://github.com/muammar/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "${_gitname}"

  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${_gitname}/"
  install -d "${pkgdir}/usr/share/${_gitname}/${_gitname}/getch/"
  install -d "${pkgdir}/usr/share/${_gitname}/images/"
  install -d "${pkgdir}/usr/share/${_gitname}/nodejs/"

  install -D -m755 bin/${_gitname} "${pkgdir}/usr/share/${_gitname}/${_gitname}.py"
  ln -s "/usr/share/${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}"

  install -D -m644 mkchromecast/*.py "${pkgdir}/usr/share/${_gitname}/${_gitname}/"
  install -D -m644 mkchromecast/getch/* "${pkgdir}/usr/share/${_gitname}/${_gitname}/getch/"
  install -D -m644 images/*.png "${pkgdir}/usr/share/${_gitname}/images/"
  install -D -m644 nodejs/html5-video-streamer.js "${pkgdir}/usr/share/${_gitname}/nodejs/"


  install -D -m644 "man/${_gitname}.1" "${pkgdir}/usr/share/man/man1/${_gitname}.1"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -D -m644 "images/${_gitname}.xpm" "${pkgdir}/usr/share/pixmaps/${_gitname}.xpm"
  install -D -m644 "${_gitname}.desktop" "${pkgdir}/usr/share/applications/${_gitname}.desktop"
}
