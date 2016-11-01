# maintainer: so wieso <sowieso@dukun.de>
pkgname=stuntman
pkgver=1.2.1
pkgrel=2
pkgdesc="STUN server and client"
url="http://www.stunprotocol.org/"
license=("Apache")
arch=("i686" "x86_64")
depends=()
optdepends=()
makedepends=("boost")
conflicts=("stuntman-git")
source=("https://github.com/jselbie/stunserver/archive/version1.2.1.zip")
sha256sums=("59c35de587699f4e8959b19d5d26173d27a9f4affe2b07b793dd95ac52508c53")

build() {
  cd "${srcdir}/stunserver-version${pkgver}"
  make
}

package() {
  cd "${srcdir}/stunserver-version${pkgver}"
  install -D -m0755 -t "$pkgdir/usr/bin/" stun{client,server}
  install -D -m0644 -t "$pkgdir/usr/share/doc/${pkgname}" HISTORY README
  install -D -m0644 <(./stunclient --help | gzip) "$pkgdir/usr/share/man/man1/stunclient.1.gz"
  install -D -m0644 <(./stunserver --help | gzip) "$pkgdir/usr/share/man/man1/stunserver.1.gz"
}
