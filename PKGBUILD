# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=strix-bin
pkgver=1.7.1
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
sha256sums_x86_64=('c8e836251578baa228afe9e65f4a901ef6ae1116c444f8f0a67f7ae7898c480f')
# Upstream names the arm64 artifacts with "arm64", not "aarch64".
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/usestrix/strix/releases/download/v$pkgver/strix-$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('e2206de811920a7e0f07933afd931c71204212e0a5f736f0164911365baa6fd2')

# Upstream tarball holds a single PyInstaller-built executable named
# strix-$pkgver-linux-<arch> (x86_64 / arm64); makepkg already unpacked it.
prepare() {
  mv "$srcdir/strix-$pkgver-linux-${CARCH/aarch64/arm64}" "$srcdir/strix"
}

package() {
  install -Dm755 "$srcdir/strix" "$pkgdir/usr/bin/strix"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
