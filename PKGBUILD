# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.11
pkgrel=1
pkgdesc='Find unused dependencies in pyproject.toml (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/pyproject-udeps'
license=('BlueOak-1.0.0')
depends=('glibc' 'libgcc')
provides=("pyproject-udeps=$pkgver")
conflicts=('pyproject-udeps')
# !debug: the release binary is already stripped, so the auto-generated
#   -debug subpackage would be empty noise.
options=(!debug)

# The release tarballs carry LICENSE.md and README.md alongside the binary, so
# no GitHub archive/ tarball is needed; those are not byte-stable over time.
_relurl="https://github.com/lukehsiao/pyproject-udeps/releases/download/v$pkgver"
source_x86_64=("pyproject-udeps-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$_relurl/pyproject-udeps-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pyproject-udeps-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$_relurl/pyproject-udeps-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("pyproject-udeps-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz::$_relurl/pyproject-udeps-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('b9e12a9212b9dd8935b1be89fa883b598767ea6df5b074afd412461b68b7bcc5')
sha256sums_aarch64=('6fb079c3d0bd440cadf113e64f00a4b53303dea0aa5dbcf8d78fca324cd001d1')
sha256sums_armv7h=('4e42e6ed20d0f72b0379e6269da5d3c8fe4c304ff63e2838c703384bd274efa5')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 "$srcdir/LICENSE.md"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
