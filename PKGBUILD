# Maintainer: Ícar N. S. <aur@icarns.xyz>

pkgname=yarn-berry
pkgver=4.9.1
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management - Active development trunk'
arch=(any)
provides=('yarn')
conflicts=('yarn')
url='https://yarnpkg.com/'
license=('BSD')
depends=('nodejs')
source=("https://github.com/yarnpkg/berry/archive/refs/tags/@yarnpkg/cli/$pkgver.tar.gz")
sha256sums=('58df07bd582586c57d250a28817a0016382458d981c8d15e292b72a0ecfcd7a7')

package() {
  cd berry--yarnpkg-cli-${pkgver}
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R * "$pkgdir"/usr/lib/node_modules/yarn
  chmod +x "$pkgdir"/usr/lib/node_modules/yarn/packages/yarnpkg-cli/bin/yarn.js

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/packages/yarnpkg-cli/bin/yarn.js "$pkgdir"/usr/bin/yarn
  ln -s /usr/lib/node_modules/yarn/packages/yarnpkg-cli/bin/yarn.js "$pkgdir"/usr/bin/yarnpkg

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
