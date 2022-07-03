# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Andrew Stubbs

pkgname=zsh-autosuggestions-git
_pkgname=${pkgname::-4}
pkgver=0.7.0.r0.ga411ef3
pkgrel=1
pkgdesc="Fish-like autosuggestions for zsh (from git)"
arch=('any')
url="https://github.com/zsh-users/zsh-autosuggestions"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/zsh-users/zsh-autosuggestions.git")
sha256sums=('SKIP')

pkgver() {
  cd zsh-autosuggestions
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd zsh-autosuggestions
  make
}

package() {
  cd zsh-autosuggestions
  install -vDm 644 ${pkgname%-git}{,.plugin}.zsh \
    -t "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/"
  # docs
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
