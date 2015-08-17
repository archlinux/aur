# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wp2git-git
pkgver=r37.2fa9117
pkgrel=1
pkgdesc="A tool to download and import a Wikipedia page to a Git repository"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/wp2git"
license=('custom')
depends=('curl' 'git')
makedepends=('git' 'gdc' 'd-stdlib')
source=(
  "$pkgname::git+https://github.com/CyberShadow/wp2git.git"
  "ae::git+https://github.com/CyberShadow/ae"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.ae.url $srcdir/ae
  git submodule update
}

build() {
  cd "$pkgname"
  rdmd --build-only wp2git
}

package() {
  cd "$pkgname"
  install -Dm755 wp2git $pkgdir/usr/bin/wp2git
  install -D LICENSE $pkgdir/usr/share/licenses/wp2git-git/LICENSE
}

# vim:set ts=2 sw=2 et:
