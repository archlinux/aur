# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com >
# Contributor: Ivan Sichmann Freitas <ivansichfreitas (at) gmail (dot) com>

pkgname=pyclewn
pkgver=2.2
pkgrel=1
pkgdesc="A Vim front-end to the gdb and pdb debuggers"
url="http://pyclewn.sourceforge.net"
license=('GPL2')
arch=('any')
depends=('python' 'vim>=7.4' 'gdb' 'python-pdb-clone')
install=pyclewn.install
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ebf268fecba93e8a4ae331b19684975eade9f2d0d637a06e5078c77918169db2b13d15a0bf1d2e3722394627d0987fb61fde8dd80e53a80b794484b0b817f45b')

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
