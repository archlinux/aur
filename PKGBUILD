# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=mkchromecast-git
_gitname=mkchromecast
pkgver=r1125.40c73f91
pkgrel=1
pkgdesc="Cast Audio/Video to your Google Cast and Sonos Devices"
arch=('any')
url="http://mkchromecast.com"
license=('MIT')
depends=('gi' 'mutagen' 'pavucontrol' 'pulseaudio' 'python' 'python-flask' 'python-netifaces' 'python-psutil' 'python-pychromecast-git' 'python-requests' 'python-setuptools' 'python-pyqt5' 'python-yaml' 'python-werkzeug' 'sox' 'lame' 'flac' 'faac')
makedepends=('git' 'python-setuptools' 'python-pip')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend and/or to cast with ALSA'
            'gstreamer: for gstreamer backend'
            'nodejs: for node backend'
            'pavucontrol: to cast with PulseAudio'
            'pulseaudio: to cast with PulseAudio'
            'python-pyqt5: system tray menu support'
            'python-soco: Sonos support'
            'youtube-dl: YouTube support')
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
