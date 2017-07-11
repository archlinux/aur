# Maintainer: Kaley Main <kaleypoole17@gmail.com>

pkgname=dgraph-bin
_pkgname=dgraph
pkgver=0.7.7
pkgrel=1
pkgdesc='a low latency, high throughput, native and distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE')
#depends=('gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz" 'dgraph.service')
sha256sums=('a46c83c21bc2d9c70dd2fd26695123a70ae4a66d6b1902bb8f037118e2dcb18b' '8bde63f163c6a925ecb884ca12aede192a307693042ff7dddf230d3e4ec2fd7e')

package() {
  cd "$srcdir/dgraph"
  for binary in dgraph dgraphloader; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  cd "$srcdir"
  install -Dm644 dgraph.service "$pkgdir/usr/lib/systemd/system/dgraph.service"
  install -d "$pkgdir/var/lib/dgraph/data"
}

# vim:set ts=2 sw=2 et:
