# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-rigel-git
pkgver=1.0.0.r39.gce441c5
pkgrel=1
pkgdesc="A 24bit colorscheme based on the star Rigel, the bright blue star of Orion"
arch=('any')
url="https://github.com/rigellute/rigel"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-rigel' 'vim-lightline-rigel')
conflicts=("${pkgname%-git}" 'vim-airline-rigel' 'vim-lightline-rigel')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload colors \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
