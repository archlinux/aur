# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=pgtune-git
_gitname=pgtune
pkgver=r32.da57e00
pkgrel=1
pkgdesc="PostgreSQL Config Tuner"
arch=('any')
url="https://github.com/gregs1104/pgtune"
license=('BSD')
depends=('python2')
provides=('pgtune')
conflicts=('pgtune')
options=(!emptydirs)
source=("git+https://github.com/gregs1104/pgtune.git"
        "settings_dir.patch")
md5sums=('SKIP'
         '887123049b3d675885ae827787eefff7')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}"
  sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' pgtune
  patch -Np1 -i "${srcdir}/settings_dir.patch"
}

package() {
  cd "${_gitname}"
  install -D -m 755 pgtune "${pkgdir}/usr/bin/pgtune"
  install -d "${pkgdir}/usr/share/pgtune"
  cp pg_settings-* "${pkgdir}/usr/share/pgtune/"
  install -D -m 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
