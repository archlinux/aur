# Maintainer: Chris Tam <LChris314 at gmail dot com>

pkgname=hunspell-en-med-glut-git
pkgver=r7.ad719a9
pkgrel=1
pkgdesc="Hunspell dictionary of English medical terms"
arch=(any)
url="https://github.com/glutanimate/hunspell-en-med-glut"
license=('GPL3')
optdepends=('hunspell: the spell checking libraries and apps')
source=("git+${url}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _dic_file=en_med_glut.dic

  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 "$_dic_file" "${pkgdir}/usr/share/hunspell"

  # myspell symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    ln -sv "/usr/share/hunspell/${_dic_file}" .
  popd

  # licenses
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
