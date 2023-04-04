# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=2.5.1
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('MIT')
depends=('python-pynvim' 'python-psutil')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mhinz/neovim-remote/archive/v$pkgver.tar.gz")
sha256sums=('cff04df8d82ea99168de441b23ee1ed21d64c6cb2196cb2e3d65a6778c14da01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 contrib/completion.bash "$pkgdir/usr/share/bash-completion/completions/neovim-remote"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
