# Maintainer:
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=hyphen-ro
pkgver=3.3.6
pkgrel=5
pkgdesc="Romanian hyphenation rules"
arch=('any')
url="http://sourceforge.net/projects/rospell/"
license=('GPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(http://downloads.sourceforge.net/rospell/hyph_ro_RO.${pkgver}.zip)
md5sums=('1f623974fda904ad828daaf01adf9ffa')

package() {
  cd "${srcdir}"

  install -dm755 ${pkgdir}/usr/share/hyphen

  install -m644 hyph_ro_RO.dic "${pkgdir}/usr/share/hyphen/hyph_ro_RO.dic"

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
}
