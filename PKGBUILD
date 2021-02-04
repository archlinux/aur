# Maintainer: David Runge <dvzrv@archlinux.org>

_name=coverage-highlight.vim
pkgname=vim-coverage-highlight
pkgver=3.3
pkgrel=1
pkgdesc="Vim plugin to highlight Python source code lines that lack test coverage"
arch=('any')
url="https://github.com/mgedmin/coverage-highlight.vim"
license=('MIT')
groups=('vim-plugins')
depends=('python-coverage' 'vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgedmin/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('42049beb26ff1bcc96713ab7e82d86ff25846e11f2b7632e5785e31e374199ed7b958119ba4cc93dc1b174b09ce190c6bb14e8afe1b5cfcf0c6b5413e1ed217d')
b2sums=('160ec8d1a3e6bc857057b61c328c71c1b3c98d1ba673ebd7b1a7bc8a472656a2eff01a669c5cb48743184c0f93590addee8a2168798aa0bb89f3ffe941c6c31d')

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
