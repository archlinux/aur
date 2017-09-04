# Maintainer: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>

_pkgname=spaceship-zsh-theme
pkgname=$_pkgname-git
pkgver=LATEST
pkgrel=1
pkgdesc='An “Oh My ZSH!” theme for Astronauts.'
arch=('any')
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
source=('git+https://github.com/denysdovhan/spaceship-zsh-theme.git')
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"

  # We don't need anything related to git in the package
  rm -rf .git*

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 spaceship.zsh "${pkgdir}/usr/share/oh-my-zsh/themes/spaceship.zsh-theme"
}
