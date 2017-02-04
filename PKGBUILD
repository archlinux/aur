# Maintainer: Samadi van Koten

pkgname=umoci
_pkgver='0.0.0-rc3' # Actual version
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='umoci modifies Open Container images'
arch=('i686' 'x86_64')
url='https://www.cyphar.com/blog/post/umoci-new-oci-image-tool'
license=('Apache 2.0')
depends=()
makedepends=("go")
conflicts=()
provides=()
options=()
source=("$pkgname.tar.gz::https://github.com/cyphar/umoci/archive/v0.0.0-rc3.tar.gz")
md5sums=('SKIP')

_repo_name='github.com/cyphar/umoci'

prepare() {
  mkdir -p "$srcdir/src/${_repo_name%/*}"
  ln -Tfs "$srcdir/$pkgname-$_pkgver" "$srcdir/src/$_repo_name"
}

build() {
  cd "$srcdir/src/$_repo_name"
  GOPATH=$srcdir make
}

package() {
  ## For `makepkg --repackage`
  cd "$srcdir/src/$_repo_name"
  install -Dm 755 -t "$pkgdir/usr/bin" umoci
}

