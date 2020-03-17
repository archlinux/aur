# Contributor: Baytars <feicuihuangfeng@qq.com>
pkgname=ambulant-player-gtk-git
pkgver=2.6
pkgrel=1
pkgdesc="open-source media player with support for SMIL 3.0"
arch=('x86_64')
url="https://www.ambulantplayer.org/"
_git=https://e.coding.net/Baytars/ambulant-2.6.git
license=('LGPL')
depends=('ffmpeg')
makedepends=('make' 'automake' 'git' 'autoconf' 'ed' 'python2' 'python')
provides=('AmbulantPlayer_gtk')
conflicts=('AmbulantPlayer_gtk')
install=AmbulantPlayer_gtk.install
source=(git+$_git)
sha256sums=('SKIP')

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
  cfgPath=`readlink ./libltdl/config-h.in`
  rm ./libltdl/config-h.in
  cp $cfgPath ./libltdl/config-h.in
  make
}

package() {
  cd ${srcdir}/ambulant-2.6
  make install DESTDIR=${pkgdir}
}
