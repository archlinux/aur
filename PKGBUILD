# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=elasticdump
pkgver=3.3.12
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://github.com/taskrabbit/elasticsearch-dump"
license=("Apache")
depends=('nodejs>=8.0')
makedepends=('npm')
source=("http://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('716250c467c2df7cd031b8a8913687f97424a2fc65748c5be95cdd9511b558b1')
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
