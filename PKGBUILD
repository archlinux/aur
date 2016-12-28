# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=go-json-gold
pkgver=r30.2e54481
pkgrel=1
pkgdesc="An implementation of the JSON-LD specification in Go"
arch=('x86_64' 'i686')
url="https://github.com/kazarena/json-gold"
license=('APACHE')
depends=('go')
makedepends=('rsync')
options=('!strip' '!emptydirs')
_gourl='github.com/kazarena/json-gold'

#pkgver() {
#  cd "${srcdir}/src/${_gourl}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  GOPATH="${srcdir}" go get -v -x ${_gourl}/...
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/lib/go"
  rsync -avz --exclude .git {src,pkg} "${pkgdir}/usr/lib/go"

  install -Dm644 "src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
