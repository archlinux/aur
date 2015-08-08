# Maintainer: XavierCLL

pkgname=kup
pkgver=0.6.0
pkgrel=1
pkgdesc="A KDE-based frontend for the bup backup software"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Kup+Backup+System?content=147465"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
optdepends=('bup: support for incremental backups'
            'rsync: support for synced backups')
install=kup.install
source=("https://github.com/spersson/Kup/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('ba71ce5caf38f63e3881ecf5d56e7eab')

build() {
  cd "Kup-${pkgname}-${pkgver}"

  [ -d build ] && rm -rf build
  mkdir build
  cd build

  cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "Kup-${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
