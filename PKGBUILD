# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp-git
_pkgname=OpenMusicPlayer
pkgver=0.0.1.r10.gc96479f
pkgrel=1
pkgdesc='gtk3 music player'
url='https://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gtkmm3 libclastfm libconfig taglib)
makedepends=(boost git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/TheWiseNoob/OpenMusicPlayer.git'
        'omp.desktop')
sha256sums=('SKIP'
            '65398127a90eec9cb79eb11a227305ec2b9f2f3ba1265e2dd1d31934205cd38c')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make -j10
  mkdir -p ~/.omp
  cp Images/No_Cover.svg ~/.omp/No_Cover.svg
}

package() {
  cd "${_pkgname}"
  install -Dm0755 omp "${pkgdir}/usr/bin/omp"
  install -Dm0644 Images/Icon_Small.png "${pkgdir}/usr/share/pixmaps/omp.png"
  install -Dm0644 ../omp.desktop "${pkgdir}/usr/share/applications/omp.desktop"
}
