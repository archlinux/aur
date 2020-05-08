# Maintainer: Thomas Gerbet <thomas at gerbet dot me>
pkgname=yubikey-agent
pkgver=0.1.0
pkgrel=1
pkgdesc='A seamless ssh-agent for YubiKeys'
arch=('x86_64')
url="https://filippo.io/yubikey-agent"
license=('BSD')
depends=('pcsclite')
makedepends=('go-pie')
source=("https://github.com/FiloSottile/yubikey-agent/archive/v${pkgver}.tar.gz")
sha256sums=('58d2bdf4391ef86f9d4ccd8e999472dafbe6204e5ad4a29de95baa28aca2116b')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
