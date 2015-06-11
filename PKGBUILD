# Maintainer:  jyantis <yantis@yantis.net>

pkgname=zsh-dwim-git
pkgver=r72.9cfd536
pkgrel=2
pkgdesc='A ZSH Do What I Mean key. Attempts to predict what you will want to do next.'
arch=('any')
url='https://github.com/oknowton/zsh-dwim'
license=('MIT')
depends=('zsh')
source=('git+https://github.com/oknowton/zsh-dwim.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('zsh-dwim')
conflicts=('zsh-dwim')
install='dwim.install'

pkgver() {
  cd zsh-dwim
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd zsh-dwim

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License which is in the README
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.rm"

  mkdir -p "${pkgdir}/usr/share/zsh-dwim"
  cp -r . "${pkgdir}/usr/share/zsh-dwim/"
}

# vim:set ts=2 sw=2 et:
