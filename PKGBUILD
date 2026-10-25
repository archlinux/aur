# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.4.0
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

sha256sums_x86_64=('185ec78b6b905f7edef0c6c3fa743968b40b1a9f982c1d88a941507ddcd9121c')
sha256sums_aarch64=('1fff201fe7e60069b75183f8348913376e806e5ed47c362e1793ecb5fc78f0c6')
sha256sums_armv7h=('cd97284d026f1fbdd93902fc5506f3cd8d0d08c8adb0f6ceae92742aa2961745')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 "$srcdir/LICENSE.md"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
