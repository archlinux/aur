# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-git
pkgver=r10171.3d5f12d
_branch=master
pkgrel=1
pkgdesc='Latest git-version of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=('desktop-file-utils'
	'gtk-update-icon-cache'
	'libpulse'
	'portaudio'
	'qt5-quick1'
	'qt5-svg'
	'qt5-tools'
	'shared-mime-info')
makedepends=('cmake'
	'doxygen'
	'git'
	'lame'
	'qt5-script'
	'texlive-bin')
optdepends=('lame: MP3 export')
conflicts=('')
install='musescore.install'

source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd MuseScore
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd MuseScore
  make revision
  make PREFIX='/usr' SUFFIX="-git" LABEL="Git Build" release
}

package() {
  cd MuseScore/build.release
  make DESTDIR="${pkgdir}" SUFFIX="-git" LABEL="Git Build" install
}
