# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=elasticdump
pkgver=6.2.2
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://github.com/taskrabbit/elasticsearch-dump"
license=("Apache")
depends=('nodejs>=8.0')
makedepends=('npm')
source=("http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('04ab7525b4b5e104ff37b1771483705e13b46c97a98c064d6cfada5a4829cedd')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/$pkgname-$pkgver.tgz"

  BASE_PATH="${pkgdir}/usr/lib/node_modules/elasticdump"
  TRASH=(
    "$BASE_PATH"/.{idea,github}
    "$BASE_PATH"/node_modules/lossless-json/.idea
    "$BASE_PATH"/node_modules/aws-sdk/.changes
  )

  # Cleanup
  for path in "${TRASH[@]}"; do
      [ -d "$path" ] && rm -r "$path"
  done

  find "$BASE_PATH" -type f -name ".*" -delete
  find "$BASE_PATH" -empty -delete
}
