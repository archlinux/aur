# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="xdg-sanity"
pkgver=0.1
pkgrel=4
pkgdesc="A tool to sanely open http/s links."
arch=("any")
url="https://git.tebibyte.media/emma/xdg-sanity"
license=("AGPL3")
source=("git+https://git.tebibyte.media/emma/xdg-sanity.git")

depends=("handlr")
makedepends=("git" "gendesk")
provides=("xdg-sanity")

sha256sums=("SKIP")

prepare() {
  cd ..
  gendesk -n PKGBUILD
  mv xdg-sanity.desktop "${srcdir}"
  touch xdg-sanity.conf
  echo "browser = " > xdg-sanity.conf
  mv xdg-sanity.conf "${srcdir}"
}

package() {
  cd $srcdir/
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/etc"
  mv "${srcdir}/${pkgname}/xdg-sanity.sh" "${pkgdir}/usr/local/bin/xdg-sanity"
  mv xdg-sanity.desktop "${pkgdir}/usr/share/applications"
  mv xdg-sanity.conf "${pkgdir}/etc"
}