# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=nodenv-node-build-git
pkgver=5.4.9.r0.gfa2a30f8
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'node-build')
depends=('bash')
source=('git+https://github.com/nodenv/node-build.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/node-build

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}"/node-build

  PREFIX="${pkgdir}"/usr ./install.sh

  # License
  install -Dm644 "${srcdir}"/node-build/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
