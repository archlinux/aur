# Maintainer: Kaley Main <kaleypoole17@gmail.com>

pkgname=dgraph-bin
_pkgname=dgraph
pkgver=1.0.6
pkgrel=1
pkgdesc='a low latency, high throughput, native and distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE')
#depends=('gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz" 'dgraph.service' 'dgraph-zero.service')
sha256sums=('616a3dc22973c48bbe57036dde5ea91055761f565a22bfbe20b6079fd16a9156'
            '6b9e93aa8cc93fd2d163e9fe963bbde998f624fdf7a558b664079bedcb716444'
            'b917a94ad1ccf6a5831bf103ccdfac64bfdc617ef00ddf8840069de3e31962bc')

package() {
  cd "$srcdir"
  for binary in dgraph; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph.service "$pkgdir/usr/lib/systemd/system/dgraph.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -d "$pkgdir/var/lib/dgraph/data"
}

# vim:set ts=2 sw=2 et:
