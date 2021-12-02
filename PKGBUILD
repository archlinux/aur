# Maintainer: David Runge <dvzrv@archlinux.org>

_name=coverage-highlight.vim
pkgname=vim-coverage-highlight
pkgver=3.4
pkgrel=2
pkgdesc="Vim plugin to highlight Python source code lines that lack test coverage"
arch=('any')
url="https://github.com/mgedmin/coverage-highlight.vim"
license=('MIT')
groups=('vim-plugins')
depends=('python-coverage' 'vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgedmin/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('a420f9b5ce226be680158f99d95e23fb49a217c142fa5826b86ce21db157bce18f7b169c20a91b0aa72be3658767ad40efce1381c3d1047b8e91a799c01f2ed1')
b2sums=('334d811ab21fe0f32a60235eb8dede6e604cc997f75bcad0d2db3de5412565ae9120148f4eee3e9933df13738d81ec0775fb7a6acd2c0b8af0b04323034de5bd')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "autoload/"*.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  install -vDm 644 "plugin/"*.vim -t "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -vDm 644 "pythonx/"*.py -t "${pkgdir}/usr/share/vim/vimfiles/pythonx/"
  # byte-compiling the python script
  find "${pkgdir}" -name '*.py' -exec python -mpy_compile {} +
  find "${pkgdir}" -name '*.py' -exec python -O -mpy_compile {} +
}
