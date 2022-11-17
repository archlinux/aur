# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=all-contributors-cli
pkgver=6.24.0
pkgrel=1
pkgdesc="Automate acknowledging contributors to your open source projects"
arch=('any')
url="https://allcontributors.org/docs/en/cli/overview"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=('25c480c5c6e921532873114c2d6487816e6c22e0')

package() {
  cd "$srcdir"

  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    --cache npm-cache \
    "$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm 644 "$pkgdir/usr/lib/node_modules/all-contributors-cli/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
