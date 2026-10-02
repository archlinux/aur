# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.10
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

sha256sums_x86_64=('ca26b25a9631201ba6482af6c44a69b463567c510b0d98cd3b79ba20b1f6efe9')
sha256sums_aarch64=('f0eeeda353c1a1382083f4c75d6b6f25c9e6813db9637412caafc60fc5c0459d')
sha256sums_armv7h=('dc7fee404f109076fd36cedefb29f4285196d2c5f7d7f66ac6e780a069f5ff1b')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 "$srcdir/LICENSE.md"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
