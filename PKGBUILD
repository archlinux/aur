# Maintainer: Arthur Skowronek <eisensheng@mailbox.org>

pkgname="deis-client"
pkgver=1.11.0
pkgrel=1
pkgdesc="Command line interface client for Deis, an open source PaaS"`
       `" that makes it easy to deploy and manage applications"`
       `" on your own servers."
arch=('x86_64' 'i686' 'armv7h')
url='http://deis.io/'
license=('APACHE')
makedepends=('go' 'godep')
source=("https://github.com/deis/deis/archive/v${pkgver}.tar.gz")
sha256sums=('ae53da596e44cbeccbf0d0f05186538f97d42344f379ed2866bf0f7b0ba018cb')


prepare() {
  cd "${srcdir}"

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
