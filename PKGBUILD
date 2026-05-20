# Maintainer: William Canin <hello.williamcanin@gmail.com>

pkgname=smog-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Turn data into unreadable noise."
arch=('x86_64')
url="https://github.com/orbitbits/smog"
license=('custom')
depends=('glibc' 'gcc-libs')
install='smog.install'
options=('!strip' '!debug')

# - Build and install via makepkg -
# Before building, import the maintainer's GPG key:
#   gpg --keyserver keyserver.ubuntu.com --recv-keys DE28149E82A46E5182C42E716FC4906130203368
# Or via direct file:
#   curl https://raw.githubusercontent.com/orbitbits/pubkey/main/pubkey.asc | gpg --import

validpgpkeys=('DE28149E82A46E5182C42E716FC4906130203368')

source=(
  "smog-$pkgver-linux-x86_64::https://raw.githubusercontent.com/orbitbits/smog/binaries/v$pkgver/smog-$pkgver-linux-x86_64"
  "SHA256SUMS::https://raw.githubusercontent.com/orbitbits/smog/binaries/v$pkgver/SHA256SUMS"
  "SHA256SUMS.sig::https://raw.githubusercontent.com/orbitbits/smog/binaries/v$pkgver/SHA256SUMS.sig"
  "LICENSE::https://raw.githubusercontent.com/orbitbits/smog/main/LICENSE"
)

sha256sums=(
  'SKIP'         # binary — verified via GPG
  'SKIP'         # SHA256SUMS — verified via GPG (SHA256SUMS.sig)
  'SKIP'         # GPG signature
  'b6f62366c51f557cfb766ccfa00cca1cdc10342b1b02a6313b0f410092dfefea' # LICENSE - manual: sha256sum LICENSE
)

prepare() {
  cd "$srcdir"

  echo "==> Verifying binary via SHA256SUMS..."
  grep "smog-$pkgver-linux-x86_64" SHA256SUMS | sha256sum -c
}

package() {
  install -Dm755 "$srcdir/smog-$pkgver-linux-x86_64" \
    "$pkgdir/usr/bin/smog"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}