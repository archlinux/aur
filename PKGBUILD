# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-database
_pkgname=TangoDatabase
pkgver=5.17
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - database server"
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-cpp' 'mariadb' 'mariadb-clients' 'mariadb-libs' 'cmake>=2.8.9' )
conflicts=('tango' 'tango-database-git')
install=tango-database.install
source=("https://gitlab.com/tango-controls/TangoDatabase/-/archive/Database-Release-${pkgver}/TangoDatabase-Database-Release-${pkgver}.tar.gz"
        "tango-database.service")
sha256sums=('c1b744ed82b668b4218d8ac9504ab7061692f1a8af7380a914eb8029bde1eac4'
            '5c54520ad2072aefe6b408d4caa8a2a9fffb093fb2ea93b46d9ab3cccbb0ae1f')

_dir="${_pkgname}-Database-Release-${pkgver}"

prepare() {
  mkdir -p ${_dir}/build
}

build() {
  cd ${_dir}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../
  make
}

package() {
  mkdir -p ${pkgdir}/etc/systemd/system
  install -Dm 644 tango-database.service ${pkgdir}/etc/systemd/system

  cd ${_dir}/build
  make DESTDIR=${pkgdir} install
}
