# maintainer kirill malyshev <keryascorpio at gmail.com>

pkgname=tboplayer-git
pkgver=146.5eb1897
pkgrel=1
pkgdesc="Raspberry Pi. A GUI for OMXPlayer"
url="https://github.com/KenT2/tboplayer"
arch=('armv6h' 'armv7h')
depends=('omxplayer' 'python2-gobject2' 'python2-dbus' 'pygtk' 'python2-requests' 'python2-pexpect' 'python2-ptyprocess' 'tk' 'ffmpeg' 'youtube-dl')
source=(git://github.com/KenT2/tboplayer.git)
md5sums=('SKIP')

pkgver() {
  cd tboplayer
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  sed -i -e '/dpkg/a \ \ \ \ \ \ \ \ if True:' \
	 -e '/dpkg/d' \
	 -e 's/\/usr\/local\//\/usr\//g' \
	 "${srcdir}/tboplayer/tboplayer.py"

  echo "#!/bin/sh" > "${srcdir}/tboplayer.sh"
  echo "python2 /usr/lib/tboplayer/tboplayer.py" >> "${srcdir}/tboplayer.sh"
}

package() {
  install -Dm755 "${srcdir}/tboplayer.sh" "${pkgdir}/usr/bin/tboplayer"
  install -Dm644 "${srcdir}/tboplayer/tboplayer.py" "${pkgdir}/usr/lib/tboplayer/tboplayer.py"
  install -Dm644 "${srcdir}/tboplayer/yt-dl_supported_sites" "${pkgdir}/usr/lib/tboplayer/yt-dl_supported_sites"
}

