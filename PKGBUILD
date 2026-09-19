# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=strix-bin
pkgver=1.6.2
pkgrel=1
pkgdesc='Open-source AI pentesting tool - autonomous AI hackers that find and fix your app vulnerabilities (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/usestrix/strix'
license=('Apache-2.0')
depends=('docker')
optdepends=(
  'ca-certificates: HTTPS targets and LLM API TLS'
)
provides=('strix')
conflicts=('strix')
options=('!strip')
install=strix.install
source=('LICENSE::https://raw.githubusercontent.com/usestrix/strix/v'"$pkgver"'/LICENSE')
sha256sums=('7db9697134251e314bd8d39257fe170c98b3e2ad9b2ed67e97acaf9613e7b9e3')
source_x86_64=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/usestrix/strix/releases/download/v$pkgver/strix-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('f3f29fa64bee420bf64f8911fb9f38e20270d406f6df44cc2436252c2af0bc81')
# Upstream names the arm64 artifacts with "arm64", not "aarch64".
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/usestrix/strix/releases/download/v$pkgver/strix-$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('4a4cba115bda8b89d7bbfabe960246a480ff43563144959b2e33477955aa6df2')

# Upstream tarball holds a single PyInstaller-built executable named
# strix-$pkgver-linux-<arch> (x86_64 / arm64); makepkg already unpacked it.
prepare() {
  mv "$srcdir/strix-$pkgver-linux-${CARCH/aarch64/arm64}" "$srcdir/strix"
}

package() {
  install -Dm755 "$srcdir/strix" "$pkgdir/usr/bin/strix"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
