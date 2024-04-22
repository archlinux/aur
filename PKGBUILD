# Maintainer: Matt Collins <matt.mattop@gmail.com>

pkgname=hunspell-cy-git
pkgver=r13.e25b2f1
pkgrel=1
pkgdesc="Hunspell dictionary for Welsh, Cymraeg"
arch=(any)
url="https://github.com/techiaith/hunspell-cy"
license=('LGPL-3.0-or-later')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('git')
source=("git+${url}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _dic_file=cy_GB.dic
  _aff_file=cy_GB.aff

  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 "$_dic_file" "${pkgdir}/usr/share/hunspell"
  install -m644 "$_aff_file" "${pkgdir}/usr/share/hunspell"

  # myspell symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    ln -sv "/usr/share/hunspell/${_dic_file}" .
    ln -sv "/usr/share/hunspell/${_aff_file}" .
  popd

  # licenses
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
