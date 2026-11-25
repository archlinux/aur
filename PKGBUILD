# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=nodenv-node-build-git
pkgver=5.4.63.r0.gd319138e
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=(
  'aria2: alternative download client'
  'curl: default download client'
  'wget: alternative download client'
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${srcdir}/${pkgname}" describe --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  PREFIX="${pkgdir}/usr" "${srcdir}/${pkgname}/install.sh"
  rmdir "${pkgdir}/usr/etc"

  install -D --mode=644 \
    "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
