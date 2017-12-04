# Maintainer: Félix Saparelli <felix @ passcod.name>

pkgname=plv8
pkgver=2.1.0
pkgrel=1
pkgdesc="V8 Engine Javascript Procedural Language add-on for PostgreSQL"
url="https://github.com/plv8/plv8"
arch=('x86_64' 'i686')
license=('PLV8JS License: https://raw.githubusercontent.com/plv8/plv8/master/COPYRIGHT')
depends=(
  'postgresql>=9.2'
  'readline'
  'ncurses5-compat-libs'
)
makedepends=(
  'clang'
  'clang-tools-extra'
  'ninja'
  'python2'
  'python2-virtualenv'
)
source=("https://github.com/plv8/plv8/archive/v${pkgver}.tar.gz")
sha512sums=('83c44111138d6804d81752226589bf0f257a513f995d9d5eedfb098579e93cb9c51b4e4f1722b8239e848d399d913e36df4eefa78724875a244b887b39eeb85a')

build() {
  cd "plv8-${pkgver}"
  ln -sf $(which python2) python
  here="$(pwd)"
  depot="${srcdir}/plv8-${pkgver}/build/depot_tools"
  make -j $(nproc) static PATH="${here}:${depot}:${PATH}"
}

package() {
  extdir="${pkgdir}/usr/share/postgresql/extension/"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plv8.so"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plv8.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plv8--${pkgver}.sql"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plcoffee.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plcoffee--${pkgver}.sql"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plls.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plls--${pkgver}.sql"
}
