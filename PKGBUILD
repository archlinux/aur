# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=mkchromecast-git
_gitname=mkchromecast
pkgver=r1008.ea1b49a7
pkgrel=2
pkgdesc="Python application to cast your audio to your Google Cast
devices."
arch=('any')
url="http://mkchromecast.com"
license=('MIT')
depends=('gi' 'mutagen' 'pavucontrol' 'pulseaudio' 'python' 'python-flask' 'python-netifaces' 'python-psutil' 'python-pychromecast-git' 'python-requests' 'python-setuptools' 'python-pyqt5' 'python-yaml' 'sox' 'lame' 'flac' 'faac')
makedepends=('git' 'python-setuptools' 'python-pip')
optdepends=('ffmpeg'
            'python-pyqt5: system tray menu support'
            'youtube-dl: youtube URLs casting support'
            'socos: cast to Sonos speakers')
provides=('mkchromecast')
conflicts=('mkchromecast')
options=('!emptydirs')
source=("git+https://github.com/muammar/${_gitname}.git#branch=devel"
"mkchromecast.sh" "mkchromecast.desktop" "mkchromecast.png")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "${_gitname}"

  install -d "${pkgdir}/usr/share/mkchromecast/"
  install -d "${pkgdir}/usr/share/mkchromecast/mkchromecast/getch/"
  install -d "${pkgdir}/usr/share/mkchromecast/images/"

  install -D -m644 mkchromecast/*.py "${pkgdir}/usr/share/mkchromecast/mkchromecast/"
  install -D -m644 mkchromecast/getch/* "${pkgdir}/usr/share/mkchromecast/mkchromecast/getch/"
  install -D -m644 mkchromecast.py "${pkgdir}/usr/share/mkchromecast/"
  install -D -m644 images/* "${pkgdir}/usr/share/mkchromecast/images/"

  install -D -m755 ../mkchromecast.sh "${pkgdir}/usr/bin/mkchromecast"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 ../mkchromecast.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mkchromecast.png"
  install -D -m644 ../mkchromecast.desktop "${pkgdir}/usr/share/applications/mkchromecast.desktop"
}
