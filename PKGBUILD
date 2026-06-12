# Maintainer: Niko <aurpkgs@niko.lgbt>

_pkgname=rimgo
pkgname=${_pkgname}-bin
pkgver=1.4.2
pkgrel=2
pkgdesc="An alternative frontend for Imgur (binary version)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/rimgo/rimgo"
options=(!lto)
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/rimgo.conf')

source=("rimgo.service" "rimgo.conf")
# explicitly save as rimgo-bin that way we can use rimgo as the "build from source" package
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
sha256sums=('2fa11fe14e1536f63f678f3334d33910c38cd67c28a4a6c94fcab9ca908197d6'
            '145cd73c55a7bc133db7e981c1485d614fadb96a49680e0bd1320f25dc28fd93')
sha256sums_x86_64=('08e95e1fb80ba556f4f5212326f98f324971a85b90853f50154c186cf90778e5')
sha256sums_aarch64=('24a205871bafe7e36ae6d01d0884695f745408d23a3e70ef95376c25b79a6f7e')

package() {
  cd "$srcdir/"
  install -Dm755 -t "${pkgdir}/usr/bin" rimgo
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${_pkgname}/"
  install -Dm644 rimgo.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 rimgo.conf -t "$pkgdir/etc/"
}
