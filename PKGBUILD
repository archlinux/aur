# Maintainer: Arthur Skowronek <eisensheng@mailbox.org>

pkgname="deis-client"
pkgver=1.12.0
pkgrel=1
pkgdesc="Command line interface client for Deis, an open source PaaS"`
       `" that makes it easy to deploy and manage applications"`
       `" on your own servers."
arch=('x86_64' 'i686' 'armv7h')
url='http://deis.io/'
license=('APACHE')
makedepends=('go' 'godep')
source=("https://github.com/deis/deis/archive/v${pkgver}.tar.gz")
sha256sums=('036bfe66831c6405a58cf68cd3685a328883897fc8d7b7842079186166557038')
md5sums=('b6c0f31a231f44e7ec1db51d969e78a7')


prepare() {
  cd "${srcdir}"

  # Delete old build just in case.
  find ./src -delete

  mkdir -p 'src/github.com/deis'
  mv "deis-${pkgver}" 'src/github.com/deis/deis'
}


build() {
  cd "${srcdir}/src/github.com/deis/deis/client"
  GOPATH="${srcdir}" godep get
}


package() {
  cd "${srcdir}"

  install -Dm755 bin/client "${pkgdir}/usr/bin/deis"
  install -Dm644 'src/github.com/deis/deis/client/LICENSE' \
                 "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
