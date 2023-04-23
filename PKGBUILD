# Maintainer: Score_Under <seejay 11@gmail com>
options=(!strip)  # Don't strip libs because there aren't any
DOC_DIRS=(opt/hydrus/help)

pkgname=hydrus-docs
upstream_name=hydrus
pkgver=524
pkgrel=1
pkgdesc="Danbooru-like image tagging and searching system for the desktop (documentation)"
arch=(any)
license=(custom)
url=http://hydrusnetwork.github.io/hydrus/
depends=()
makedepends=(git 'mkdocs>=1.3.0' mkdocs-material 'pymdown-extensions>=9.4')
source=("${upstream_name}::git+https://github.com/hydrusnetwork/${upstream_name}.git#commit=43ae2c2593c8e900b40460191b8379229578f52c")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${upstream_name}"

  msg 'Building documentation...'
  mkdocs build -d help
}

package() {
  cd "${srcdir}/${upstream_name}"

  # Create /opt/hydrus and copy hydrus docs to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r help "${pkgdir}/opt/hydrus/"

  # Install license files
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
