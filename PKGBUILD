# maintainer: so wieso <sowieso@dukun.de>
pkgname=stuntman
pkgver=1.2.16
pkgrel=2
pkgdesc="STUN server and client"
url="http://www.stunprotocol.org/"
license=("Apache")
arch=("i686" "x86_64")
depends=("openssl-1.1")
optdepends=()
makedepends=("boost")
conflicts=("stuntman-git")
source=("https://github.com/jselbie/stunserver/archive/master.zip"
        "stuntman.service"
       )
sha256sums=("c7abb8a1d100adaea3f382fce2c3ed839942707612c3819d75abbfecc28d9416"
            "12d370aa690cef0c7e01aa5a13aa09ee0fc78b0ebce8b85c1f6202e2ceaeffa9"
           )

build() {
  cd "${srcdir}/stunserver-master"
  make
}

package() {
  cd "${srcdir}/stunserver-master"
  install -D -m0755 -t "$pkgdir/usr/bin/" stun{client,server}
  install -D -m0644 -t "$pkgdir/usr/share/doc/${pkgname}" HISTORY README
  install -D -m0644 <(./stunclient --help | gzip) "$pkgdir/usr/share/man/man1/stunclient.1.gz"
  install -D -m0644 <(./stunserver --help | gzip) "$pkgdir/usr/share/man/man1/stunserver.1.gz"
  install -D -m0644 ../stuntman.service "$pkgdir/usr/lib/systemd/system/stuntman.service"
}
