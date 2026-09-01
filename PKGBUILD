# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps-bin
pkgver=0.3.9
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

sha256sums_x86_64=('fe7a7536e34ec09f9dc1251b6ce3af2f1d0a51c22acb638ad5543997a887d577')
sha256sums_aarch64=('1d35ed2a9c2f3283813dddac23f15762a3d8cea65921311a8a7822fe5305c4e6')
sha256sums_armv7h=('d7c3055ac825db5cdcc4743343d79fc1c80ccd542b0f8b6dfb85ece9bca6943a')

package() {
    install -Dm755 "$srcdir/pyproject-udeps" "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 "$srcdir/LICENSE.md"      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$srcdir/README.md"       "$pkgdir/usr/share/doc/$pkgname/README.md"
}
