# Contributor: Baytars <feicuihuangfeng@qq.com>
pkgname=ambulant-player-gtk-git
pkgver=2.6
pkgrel=1
pkgdesc="open-source media player with support for SMIL 3.0"
arch=('x86_64')
url="https://www.ambulantplayer.org/"
_git=https://e.coding.net/Baytars/ambulant-2.6.git
license=('LGPL')
depends=('ed' 'python2' 'python' 'ffmpeg')
makedepends=('make' 'automake' 'git' 'autoconf')
provides=('AmbulantPlayer_gtk')
conflicts=('AmbulantPlayer_gtk')
install=AmbulantPlayer_gtk.install
source=(git+$_git 'AmbulantPlayer_gtk.desktop')
sha256sums=('SKIP'
            '911a056fae3e4e403092027d3b4a56080ec1dcec23736b8c3ef45a489d2a7512')

build() {
  cd ${srcdir}/ambulant-2.6

  echo "Below script has been written in build.sh"
  echo "Make sure you have Modified po/Makefile.in. The GETTEXT_MACRO_VERSION variable has to match your current gettext version."
  gettext --version
  cd ./third_party_packages
  python2 ../scripts/build-third-party-packages.py linux
  cd ../
  ./autogen.sh
  ./configure
  sudo make
}

package() {
  install -D -m755 ${srcdir}/ambulant-2.6/src/player_gtk/AmbulantPlayer_gtk ${pkgdir}/usr/bin/AmbulantPlayer_gtk
  install -d ${pkgdir}/usr/share/AmbulantPlayer_gtk
  install -D -m644 ${srcdir}/ambulant-2.6/src/libambulant/Ambulant.png ${pkgdir}/usr/share/pixmaps/AmbulantPlayer_gtk.png
  install -D -m644 ${startdir}/AmbulantPlayer_gtk.desktop ${pkgdir}/usr/share/applications/AmbulantPlayer_gtk.desktop
}
