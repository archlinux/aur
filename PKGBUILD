# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=dnspeep
pkgver=0.1.2
pkgrel=1
pkgdesc='Spy on the DNS queries your computer is making'
url='https://github.com/jvns/dnspeep'
arch=('x86_64')
license=('MIT')
depends=('libpcap')
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d8e2aab4eb541f7050d07b1d9bbc23d89293698884f688914c7e6ae55dec9a11')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm644 "${srcdir}/$pkgname-$pkgver/License.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/dnspeep" "${pkgdir}/opt/$pkgname/dnspeep"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/README.md" "${pkgdir}/opt/$pkgname/README.md"

  # link to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/dnspeep "${pkgdir}/usr/bin"
}
