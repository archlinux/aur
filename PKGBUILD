# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-nerdtree-git
pkgver=6.10.16.r0.g9310f91
pkgrel=1
pkgdesc='Tree explorer plugin for navigating the filesystem'
arch=('any')
url='https://github.com/preservim/nerdtree'
license=('custom:WTFPL')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-nerdtree')
conflicts=('vim-nerdtree')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc lib nerdtree_plugin plugin syntax -type f \
    -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set et sw=2 ts=2 tw=79:
