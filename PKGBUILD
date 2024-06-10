# Maintainer: RiverOnVenus <error@zhui.dev>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=cppman-git
pkgver=0.5.6.r5.ga3f3846
pkgrel=1
pkgdesc="C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com."
arch=('any')
url='https://github.com/aitjcize/cppman'
license=('GPL3')
depends=('bash' 'python' 'python-beautifulsoup4' 'python-html5lib')
optdepends=(
  "vim: for using vim as a pager"
  "neovim: for using nvim as a pager"
  "perl: for bash/zsh completion"
  )
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('cppman')
conflicts=('cppman')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

prepare(){
  cd $pkgname
  git clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
