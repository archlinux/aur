# Maintainer: David Runge <dvzrv@archlinux.org>

_name=coverage-highlight.vim
pkgname=vim-coverage-highlight
pkgver=3.5
pkgrel=2
pkgdesc="Vim plugin to highlight Python source code lines that lack test coverage"
arch=(any)
url="https://github.com/mgedmin/coverage-highlight.vim"
license=(MIT)
groups=(vim-plugins)
depends=(python-coverage vim)
source=($pkgname-$pkgver.tar.gz::https://github.com/mgedmin/$_name/archive/$pkgver.tar.gz)
sha512sums=('b0cd50ba1f4b97c6a1d09fcb724a2f6f6804b3206d8db1cac120ea4087f24347bb3b90b519359e6280e1b8764264a9dd4f0f4d85a011c7ebab10ad6fbcd6e861')
b2sums=('503c6b7f642d453b64f20f9a673452b1aad4664f9214342afd530db5386f7f2decfeffef528ad8dc0118b0ed21a5d0b6e9d678feff7309c1ecca47cf03a4146b')

package() {
  cd $_name-$pkgver
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 autoload/*.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -vDm 644 plugin/*.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -vDm 644 pythonx/*.py -t "$pkgdir/usr/share/vim/vimfiles/pythonx/"
  # byte-compiling the python script
  find "$pkgdir" -name '*.py' -exec python -mpy_compile {} +
  find "$pkgdir" -name '*.py' -exec python -O -mpy_compile {} +
}
