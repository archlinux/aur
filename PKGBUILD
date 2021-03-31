# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=20kly
pkgver=1.5.0
pkgrel=1
pkgdesc="20'000 Light Years Into Space game"
arch=('any')
url="http://www.jwhitham.org/20kly/"
license=('GPL')
depends=('python-pygame' 'glpk')
checkdepends=(python-pytest python-coverage mypy)
provides=('20kly')
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
  export PYTHONHASHSEED=0
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  mkdir -p "${pkgdir}/usr/share/lightyears"
  cp -a data lib20k "${pkgdir}/usr/share/lightyears/"
  ln -s lib20k "${pkgdir}/usr/share/lightyears/code"

  install -D lightyears "${pkgdir}/usr/bin/lightyears"

  install -Dm644 manual.pdf -t "${pkgdir}/usr/share/doc/lightyears/"
}
