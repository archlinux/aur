# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=nodejs-gtop-git
_gitname=nodejs-gtop
pkgver=0.1.4.r10.g149c7fd
pkgrel=1
pkgdesc="System monitoring dashboard for terminal"
arch=('any')
url="https://github.com/aksakalli/gtop"
license=('MIT')
depends=('nodejs>=4.0.0')
makedepends=(
  'git'
  'npm'
)
provides=('nodejs-gtop')
conflicts=('nodejs-gtop')
options=(!emptydirs)
source=(
  "$_gitname::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # Fix error with npm5 issue
  tar -czf nodejs-gtop.tar.gz nodejs-gtop
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" ../*.tar.gz
}

# vim:set ts=2 sw=2 et:
