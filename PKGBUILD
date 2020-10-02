# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool for managing change logs."
arch=(any)
url="https://github.com/FACT-Finder/snage"
license=('MIT')
depends=('nodejs')
optdepends=('git: git-version provider')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FACT-Finder/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('760b9b94909c19813998b81de7c2f62f1dec21c87dbcf9d1f9d91335727091a2')
options=(!strip)

package() {
  cd "$pkgname-$pkgver"
  yarn --frozen-lockfile
  BUILD_VERSION=${pkgver} yarn lerna run build

  install -d "$pkgdir/usr/lib/$pkgname"
  cd "$pkgdir/usr/lib/$pkgname"
  cp -a "$srcdir/$pkgname-$pkgver/packages/snage/build/npm/." .

  chmod +x "snage.js"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/snage.js" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
