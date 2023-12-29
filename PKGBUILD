pkgname=qepgs-player-git
pkgver=2.1.1
pkgrel=1
pkgdesc='An application to watch videos recorded by EPGStation.'
arch=('i686' 'x86_64')
url='https://gitlab.com/oioi555/QEPGS-Player'
license=('GPL2')

depends=('qt5-base' 'qt5-declarative' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'mpv' 'postgresql-libs' 'mariadb-libs' 'breeze-icons')
makedepends=('cmake' 'ninja' 'pkgconf' 'qt5-tools')

source=("${pkgname}::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${pkgname}/
  git describe --abbrev=0 --tags | sed -z 's/^v//;s/\\n//'
}

build() {
    cd ${srcdir}/${pkgname}/
    cmake -G Ninja -B build -DCMAKE_PREFIX_PATH:PATH=/usr/lib/cmake/Qt5
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}/
    DESTDIR=${pkgdir} cmake --install build --config Release
}
