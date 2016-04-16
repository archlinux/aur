# Maintainer: buckket <buckket@cock.li>

pkgname=htwtxt
pkgver=1.0.6
pkgrel=2
pkgdesc="hosted twtxt server (in Go)"
arch=("x86_64" "i686")
license=("AGPL")
url="https://github.com/plomlompom/htwtxt"
depends=("glibc")
makedepends=("go" "git")
options=('!strip' '!emptydirs')
install=htwtxt.install
source=("https://github.com/plomlompom/${pkgname}/archive/${pkgver}.tar.gz" "htwtxt.patch")
sha256sums=("33f93146b93b33ee6946e9aae3a3df137ab7e7a912f0008a03e88d42072a847a"
            "dfc87ef17977d28e490a59312b2a772f30aa57a07ad2106d3ff2a8319714e827")

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

