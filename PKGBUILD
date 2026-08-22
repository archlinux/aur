# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.8
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

sha256sums_x86_64=('54abac8e1e2b82fcc4330d7d8c18a3f716c1ae75092c51a3628ea15cb0959df3')
sha256sums_aarch64=('c29a914e287fd2cb3478e7b5c1143756dedfee7324a755b7b903abfe89a795da')
sha256sums_armv7h=('d5384402f75835a28dbf2f5fee337dd6363f4cc8b95e4676cb6ebfa8d12005a3')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 "$srcdir/LICENSE.md"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
