# Maintainer: buckket <buckket@cock.li>

pkgname=htwtxt
pkgver=1.0.7
pkgrel=1
pkgdesc="hosted twtxt server (in Go)"
arch=("x86_64" "i686")
license=("AGPL")
url="https://github.com/plomlompom/htwtxt"
depends=("glibc")
makedepends=("go" "git")
options=('!strip' '!emptydirs')
install=htwtxt.install
source=("https://github.com/plomlompom/${pkgname}/archive/${pkgver}.tar.gz" "htwtxt.patch")
sha256sums=('13059ce7285a2245e46cac35794babbf7218eb14e43e54ee5aec2a4b992702bd'
            'dfc87ef17977d28e490a59312b2a772f30aa57a07ad2106d3ff2a8319714e827')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ../htwtxt.patch 
  GOPATH=`pwd` go get -d -v
}

build() {
  cd ${pkgname}-${pkgver}
  GOPATH=`pwd` go build
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -rf templates "${pkgdir}/usr/share/${pkgname}"
}

