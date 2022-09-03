# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="xdg-sanity"
pkgver=0.1
pkgrel=5
pkgdesc="A tool to sanely open http/s links."
arch=("any")
url="https://git.tebibyte.media/emma/xdg-sanity"
license=("AGPL3")
source=("git+https://git.tebibyte.media/emma/xdg-sanity.git")
backup=("etc/xdg-sanity.conf")
depends=("handlr")
makedepends=("git" "gendesk")
provides=("xdg-sanity")

sha256sums=("SKIP")

prepare() {
  cd ..
  gendesk -n --exec="xdg-sanity %U" --genericname="Web Browser" --categories="Network;WebBrowser" --mimetypes="text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall" PKGBUILD
  mv xdg-sanity.desktop "${srcdir}"
}

package() {
  cd $srcdir/
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/etc"
  mv "${pkgname}/xdg-sanity.sh" "${pkgdir}/usr/local/bin/xdg-sanity"
  mv "${pkgname}/xdg-sanity.conf" "${pkgdir}/etc"
  mv xdg-sanity.desktop "${pkgdir}/usr/share/applications"
}