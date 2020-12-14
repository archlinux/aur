# Maintainer:
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: skysphr <skysphr@protonmail.com>

pkgname=hyphen-ro
pkgver=3.3.10
pkgrel=5
pkgdesc="Romanian hyphenation rules"
arch=('any')
url="http://sourceforge.net/projects/rospell/"
license=('GPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(http://downloads.sourceforge.net/rospell/hyph_ro_RO.${pkgver}.zip)
md5sums=('55ce8237c31227662cafe9ad6b5505a8')

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
