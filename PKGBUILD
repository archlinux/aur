# Maintainer: YesDay <yesdayuk[you know]gmail[you know]com>
_pkgname=git-lfs
pkgname=$_pkgname-arm
pkgver=2.3.4
pkgrel=1
pkgdesc="An open source Git extension for versioning large files on ARMv7, ARMv6 and ARMv8 (64-bit)"
url="https://git-lfs.github.com/"
arch=('armv6h' 'armv7h' 'aarch64')
_vendor="github.com/git-lfs/$_pkgname"
license=('MIT')
makedepends=('go' 'ruby-ronn')
depends=('git>=1.8.5')
provides=("$_pkgname" "$_pkgname-bin")
conflicts=("$_pkgname" "$_pkgname-bin")
install=$_pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://$_vendor/archive/v$pkgver.tar.gz)
sha1sums=('145d49542e9dfdec91a2bb0c52c037c67551a447')

_vendorpath="gopath/src/$_vendor"

prepare() {
  mkdir -p $(dirname gopath/src/$_vendor)
  ln -sf "$srcdir"/$pkgname-$pkgver gopath/src/$_vendor
}

build() {
  export GOPATH="$srcdir"/gopath
  cd $_vendorpath
  ./script/bootstrap
  ./script/man
}

package() {
  cd $_vendorpath
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/share/man/man1
  install -Dm644 man/*.1 "$pkgdir"/usr/share/man/man1
}
