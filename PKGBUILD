# Maintainer: William Canin <hello.williamcanin@gmail.com>

pkgname=smog-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Turn data into unreadable noise."
arch=('x86_64')
url="https://github.com/evolvbits/smog"
license=('custom')
depends=('glibc' 'gcc-libs')
install='smog.install'
options=('!strip' '!debug')

# - Build and install via makepkg -
# Before building, import the maintainer's GPG key:
#   gpg --keyserver keyserver.ubuntu.com --recv-keys 09E5808E5970720142EDFC4FE6A5CC75350F3DCE
# Or via direct file:
#   curl https://raw.githubusercontent.com/evolvbits/pubkey/main/pubkey.asc | gpg --import

validpgpkeys=('09E5808E5970720142EDFC4FE6A5CC75350F3DCE')

source=(
  "smog-$pkgver-linux-x86_64::https://raw.githubusercontent.com/evolvbits/smog/binaries/v$pkgver/smog-$pkgver-linux-x86_64"
  "SHA256SUMS::https://raw.githubusercontent.com/evolvbits/smog/binaries/v$pkgver/SHA256SUMS"
  "SHA256SUMS.asc::https://raw.githubusercontent.com/evolvbits/smog/binaries/v$pkgver/SHA256SUMS.asc"
  "LICENSE::https://raw.githubusercontent.com/evolvbits/smog/main/LICENSE"
)

sha256sums=(
  'SKIP'         # binary — verified via GPG
  'SKIP'         # SHA256SUMS — verified via GPG (SHA256SUMS.asc)
  'SKIP'         # GPG signature
  'c22e966230beaa3e13b78fd849cafa16e15fa95a82d307dd2cf501d06d0cf4a3' # LICENSE - manual: sha256sum LICENSE
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