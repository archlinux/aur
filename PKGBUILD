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
source=("git+https://github.com/muammar/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "${_gitname}"

  install -d "${pkgdir}/usr/bin/"
  install -Dm755 "bin/${_gitname}" "${pkgdir}/usr/share/${_gitname}/${_gitname}.py"
  ln -s "/usr/share/${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}"

  install -Dm644 -t "${pkgdir}/usr/share/${_gitname}/${_gitname}/" mkchromecast/*.py
  install -Dm644 -t "${pkgdir}/usr/share/${_gitname}/${_gitname}/getch/" mkchromecast/getch/*
  install -Dm644 -t "${pkgdir}/usr/share/${_gitname}/images/" images/*.png
  install -Dm644 -t "${pkgdir}/usr/share/${_gitname}/nodejs/" nodejs/html5-video-streamer.js

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/applications/${_gitname}.desktop" "${_gitname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/${_gitname}.xpm" "images/${_gitname}.xpm"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1/${_gitname}.1" "man/${_gitname}.1"
}
