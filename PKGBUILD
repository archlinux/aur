# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp-git
pkgver=0.0.1.r4
pkgrel=2
pkgdesc='GTK3-based Music Player'
url='https://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gtkmm3 libclastfm libconfig taglib)
makedepends=(boost git)
provides=('omp')
conflicts=('omp')
source=("$pkgname::git+https://github.com/TheWiseNoob/OpenMusicPlayer.git"
        "omp.desktop")
sha256sums=('SKIP'
            '65398127a90eec9cb79eb11a227305ec2b9f2f3ba1265e2dd1d31934205cd38c')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -DCm0755 omp "${pkgdir}/usr/bin/omp"
  install -Dm0644 Images/No_Cover.svg "${pkgdir}/usr/share/pixmaps/no_cover.png"
  install -Dm0644 Images/Icon_Small.png "${pkgdir}/usr/share/pixmaps/omp.png"
  install -Dm0644 ../omp.desktop "${pkgdir}/usr/share/applications/omp.desktop"
}
