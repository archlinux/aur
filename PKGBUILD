# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: matmoser@wu.ac.at

pkgname=git-fat-git
pkgver=r84.d5b388c
pkgrel=1
pkgdesc="Simple way to handle fat files without committing them to git"
arch=('any')
url="https://github.com/jedbrown/git-fat"
license=('BSD')
depends=('git' 'rsync' 'python2')
source=("git+https://github.com/jedbrown/git-fat.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # fix shebang
  sed -i '1s|env python$|&2|g' ${pkgname%-*}/git-fat
}

package() {
  cd ${pkgname%-*}

  install -Dm0755 git-fat "$pkgdir"/usr/bin/git-fat
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
