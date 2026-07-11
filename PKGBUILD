# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ghpending-bin
_pkgname=ghpending
pkgver=0.4.0
pkgrel=1
pkgdesc="Watch GitHub repos for open issues and pull requests at a glance (prebuilt binary)"
arch=('x86_64')
url="https://github.com/akitaonrails/ghpending"
license=('MIT')
depends=('gcc-libs' 'glibc' 'ca-certificates')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
# The GitHub release tarball ships a stripped binary, so re-stripping is a
# no-op and the auto-generated -debug split would be empty.
options=('!strip' '!debug')

source=(
    "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
    "README-$pkgver.md::$url/raw/v$pkgver/README.md"
)
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums=(
    '18332c61780ce8e694d4fa330770cd4d8c85e33f47ac13a80d72d70bb032ae72'
    '903426cec371163b24b971a549360ba8851ec851ce89bfd88dc3888622afb561'
)
sha256sums_x86_64=('175e83c250f5d2532871e13bc2729235b0a6ff1fe54e2c4c261eadefb365d80a')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                     "ghpending"
    install -Dm0644 "README-$pkgver.md"                       "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 "LICENSE-$pkgver"                         "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
