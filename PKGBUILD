# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: Gabriel Moura <g@srmoura.com.br>

pkgname=('webp-thumbnailer')
pkgver='r4.d6f4d89'
pkgrel=1
pkgdesc='Creates thumbnails for .webp files'
arch=('any')
url='https://github.com/gabrielmoura/webp-thumbnailer'
license=('GPL3')
depends=('bash')
makedepends=('git')
source=(
  "git+${url}#commit=d6f4d8937129f8d1d9b1964e743777c9665f842a"
  "fixpath.patch::${url}/pull/2.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  patch -p1 -i "../fixpath.patch"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/thumbnailers/webp.thumbnailer" "${pkgdir}/usr/share/thumbnailers/webp.thumbnailer"
}