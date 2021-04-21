# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=fish-embark-theme-git
pkgver=r4.e7a332f
pkgrel=1
pkgdesc="A port of the Embark colorscheme for Fish shell"
arch=('any')
url="https://git.sr.ht/~lmartinez/fish-embark-theme"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find conf.d \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
