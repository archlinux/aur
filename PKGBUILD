# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ghpending-bin
_pkgname=ghpending
pkgver=0.4.2
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
    '5d1ac951d6e0ec9139b972ab7144ad57f508a801ade7e8c165cbc8af57bac55d'
)
sha256sums_x86_64=('a65bf9dc4101e88f7afde01e44bd1ae37b90d01fa84c42009f132614f5d2bca5')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                     "ghpending"
    install -Dm0644 "README-$pkgver.md"                       "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 "LICENSE-$pkgver"                         "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
