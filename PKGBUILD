# Maintainer: Guilherme Machado <machadofguilherme@gmail.com>

pkgname=distrodown-git
pkgrel=1
pkgver=8
pkgdesc="Download Easy Linux distros"
arch=('any')
url="https://github.com/automatizando/${pkgname%-git}"
license=('GPL3')
depends=('wget')
makedepends=('git')
optdepends=()
source=("${pkgname%-git}::git+https://github.com/automatizando/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo "$(git rev-list --count master)"
}

package() {
  cd ${pkgname%-git}

  # binaries
  mkdir -p ${pkgdir}/usr/bin/

  # copy all executables
  find . -executable -not -path '/\.' -type f -exec cp {} ${pkgdir}/usr/bin \;

  # shared
  mkdir -p $pkgdir/usr/share/${pkgname%-git}
  cp README.md $pkgdir/usr/share/${pkgname%-git}
  cp LICENSE $pkgdir/usr/share/${pkgname%-git}
}
