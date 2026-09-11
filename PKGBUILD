# Maintainer: mfw <espadonne@outlook.com>

pkgname=lupin-bin
_pkgname=lupin
pkgver=0.1.32
pkgrel=1
pkgdesc='The reference interpreter for the wolf language, and the compiler differential oracle (release archive)'
arch=('x86_64' 'aarch64')
url='https://github.com/wolffe-lang/wolf-interp'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
optdepends=('wolf-lang-bin: the compiler lupin is differentially tested against')
# A -bin package redistributes the release's own bytes: no re-strip,
# and no debug split out of a binary whose sources are not here.
options=('!strip' '!debug')
provides=("lupin=$pkgver")
conflicts=('lupin')
# The archives the release publishes, byte for byte — so the D57 stamp
# inside them is the release job's own and `lupin --version` prints the
# bare version with no `+dev` suffix.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lupin-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/lupin-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bb48e7ac61ece5b7569bdc2734d94087884edff5b3a984278f5333fdef9ee508')
sha256sums_aarch64=('786e30a4a4e8e2d73aac9d6da217eef8199d1bfc26861f3876a3a2b95b6ec3fd')

package() {
    local _triple
    case "$CARCH" in
        x86_64)  _triple=x86_64-unknown-linux-gnu ;;
        aarch64) _triple=aarch64-unknown-linux-gnu ;;
    esac
    cd "lupin-$pkgver-$_triple"

    install -Dm755 lupin "$pkgdir/usr/bin/lupin"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
