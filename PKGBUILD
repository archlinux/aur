# Maintainer: FACT-Finder <ff-dev@fact-finder.com>

pkgname=snage
pkgver=0.5.8
pkgrel=1
pkgdesc="A tool for managing change logs."
arch=(any)
url="https://github.com/FACT-Finder/snage"
license=('MIT')
depends=('nodejs')
optdepends=('git: git-version provider')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FACT-Finder/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('24258c5fe966c712367e58918c845f1b7ce0b6f4c80ebd1669a0258021b78dd9')
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
