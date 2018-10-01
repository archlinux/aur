# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=thunderbird-firetray-57-git
pkgver=r603.15a4d3e
pkgrel=1
pkgdesc="Js-ctypes rewrite of the binary XPCOM version of Firetray"
arch=('any')
url="https://github.com/firetray-updates/FireTray"
license=('GPL3')
makedepends=('git' 'zip')
source=("$pkgname"::'git://github.com/firetray-updates/FireTray.git#branch=thunderbird-57')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cd src
  make build
}

package() {
  cd "$srcdir/$pkgname"
  cd build-15a4d3e
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"

  install -d -m755 "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"
  cd "${pkgdir}/usr/lib/thunderbird/extensions/${emid}"

  unzip "${srcdir}/${pkgname}/build-15a4d3e/firetray-*.xpi"
}
