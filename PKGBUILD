# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com >
# Contributor: Ivan Sichmann Freitas <ivansichfreitas (at) gmail (dot) com>

pkgname=pyclewn
pkgver=2.1
pkgrel=1
pkgdesc="A Vim front-end to the gdb and pdb debuggers"
license=('GPL2')
arch=('any')
url="http://pyclewn.sourceforge.net"
depends=('python' 'vim>=7.4' 'gdb' 'python-pdb-clone')
install=pyclewn.install
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('346b98a9e37957a5bf97b8901247f56fa8e38bddac38727867773cf4e78e555d6a85848c4c400d1faf1159ba61122cfd4931c95a67e3b2abdfaae7996beb4f1b')

package() {
  cd ${pkgname}-${pkgver}

  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  # install vimball
  install -d "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "let g:vimball_home = \"${pkgdir}/usr/share/vim/vimfiles\"" \
    -S ./lib/clewn/runtime/${pkgname}-${pkgver}.vmb -c "q" < /dev/tty > /dev/tty
  # fix vimball garbage
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
  sed -ri "s|${pkgdir}||g" "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
}

# vim: ts=2 sw=2 et:
