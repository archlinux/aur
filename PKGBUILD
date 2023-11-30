# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=20kly
pkgver=1.5.0
pkgrel=2
pkgdesc="20'000 Light Years Into Space game"
arch=('any')
url="http://www.jwhitham.org/20kly/"
license=('GPL')
depends=('python>=3.6' 'python-pygame>=2.0' 'glpk')
checkdepends=('python-pytest>=6.2' 'python-pytest-cov>=2.11')
source=("${pkgname}.tar.gz::https://github.com/20kly/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-fix-lightyears-path.patch')
md5sums=('1e698cd23bf6e016c59b984660a2d47b'
         'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 -i "$srcdir/0001-fix-lightyears-path.patch"
}

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/lightyears"
  cp -a data lib20k "${pkgdir}/usr/share/lightyears/"
  ln -s lib20k "${pkgdir}/usr/share/lightyears/code"

  install -D lightyears "${pkgdir}/usr/bin/lightyears"

  install -Dm644 manual.pdf -t "${pkgdir}/usr/share/doc/lightyears/"
}

check() {
    cd "${pkgname}-${pkgver}"
    python tests/run_all_tests.py --no-mypy
}
