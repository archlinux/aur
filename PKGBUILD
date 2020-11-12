# Maintainer: David Runge <dvzrv@archlinux.org>

_name=coverage-highlight.vim
pkgname=vim-coverage-highlight
pkgver=3.0.1
pkgrel=3
pkgdesc="Vim plugin to highlight Python source code lines that lack test coverage"
arch=('any')
url="https://github.com/mgedmin/coverage-highlight.vim"
license=('MIT')
groups=('vim-plugins')
depends=('python-coverage' 'vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgedmin/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('4f3a23d79a8be2f04b0e4d2c7d2f9430a1db56e51e0713344a0abfaa97203c4bb1795ea158344744f4ba789fe7b2dc953bb9b7b89e09a699b73a63168f7f25eb')
b2sums=('e631a4b70da1320c55b0991bb03b8ade2a3a00d166d2b12e13c0dc9eae79fd4876774eec5e8b84965d83f2a10c6db5acbd095d8b2092744c27cdd9670a4ec046')

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
