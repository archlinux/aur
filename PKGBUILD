# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com >
# Contributor: Ivan Sichmann Freitas <ivansichfreitas (at) gmail (dot) com>

pkgname=pyclewn
pkgver=2.3
pkgrel=1
pkgdesc="A Vim front-end to the gdb and pdb debuggers"
url="http://pyclewn.sourceforge.net"
license=('GPL2')
arch=('any')
depends=('python' 'vim>=7.4' 'gdb' 'python-pdb-clone')
install=pyclewn.install
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/pyclewn/pyclewn-${pkgver}.tar.gz)
sha512sums=('3b709a18139a828579078ddd99ce71fefbacce3db38856fc8ea5635a3ec23711f6df02de4491b1362e4de60416dfaf0ecd947ac0242828266d9d33c1f3c7aa8d')

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
