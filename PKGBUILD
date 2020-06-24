# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for managing change logs."
arch=(any)
url="https://github.com/FACT-Finder/snage"
license=('MIT')
depends=('nodejs')
optdepends=('git: git-version provider')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FACT-Finder/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a153949e5497e96227fab04528de6558ee801fcd51c2773b4bec88413ba42cad')
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
