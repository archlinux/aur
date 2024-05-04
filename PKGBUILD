pkgname=qepgs-player-git
pkgver=2.1.3
pkgrel=1
pkgdesc='An application to watch videos recorded by EPGStation.'
arch=('i686' 'x86_64')
url='https://gitlab.com/oioi555/QEPGS-Player'
license=('GPL2')

depends=('qt6-base' 'qt6-declarative' 'qt6-webengine' 'qt6-svg' 'qt6-5compat' 'qt6-shadertools' 'mpv' 'postgresql-libs' 'mariadb-libs' 'breeze-icons')
makedepends=('cmake' 'ninja' 'pkgconf' 'qt6-tools')

source=("${pkgname}::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${pkgname}/
  git describe --abbrev=0 --tags | sed -z 's/^v//;s/\\n//'
}

build() {
    cd ${srcdir}/${pkgname}/
    cmake -G Ninja -B build -DCMAKE_PREFIX_PATH:PATH=/usr/lib/cmake/Qt6
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}/
    DESTDIR=${pkgdir} cmake --install build --config Release
}
