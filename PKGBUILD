# Maintainer: Cycloheptan <carl.schneider+archlinux at rub dot de>
pkgname=ethereumjs-testrpc-git
pkgver=4.0.0
pkgrel=0
pkgdesc='Fast Ethereum RPC client for testing and development'
url='https://github.com/ethereumjs/testrpc'
arch=('any')
license=('MIT')
source=("testrpc::git+https://github.com/ethereumjs/testrpc.git")
makedepends=('npm')
depends=('nodejs')
sha256sums=('SKIP')
provides=('testrpc')

package() {
  cd "${srcdir}/testrpc"
  rm -Rf .git*
  npm install

  mkdir -p "${pkgdir}/usr/lib/"
  cp -R "${srcdir}/testrpc" "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/testrpc/build/cli.node.js" "${pkgdir}/usr/bin/testrpc"

  install -D -m644 "${srcdir}/testrpc/LICENSE" "${pkgdir}/usr/share/licenses/testrpc/LICENSE"
}
