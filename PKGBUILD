# Maintainer:  jyantis <yantis@yantis.net>

pkgname=zaw-git
pkgver=r179.c3308b6
pkgrel=1
pkgdesc='zsh anything.el-like widget'
arch=('any')
url='https://github.com/zsh-users/zaw'
license=('custom')
depends=('zsh')
source=('git+https://github.com/zsh-users/zaw.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('zaw')
conflicts=('zaw')
install='zaw.install'

pkgver() {
  cd zaw
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd zaw

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  mkdir -p "${pkgdir}/usr/share/zaw"
  cp -r . "${pkgdir}/usr/share/zaw/"

}


# vim:set ts=2 sw=2 et:
