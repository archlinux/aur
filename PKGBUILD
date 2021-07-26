# Maintainer: Denis Zheleztsov <difrex.punk@gmail.com>
pkgname=swaymgr
_pkgname=swaymgr
pkgver=0.1.1
pkgrel=1
pkgdesc="Sway autotiling manager"
arch=('x86_64')
license=('Apache 2.0')
depends=()
makedepends=(
  'go'
  'git'
)

source=(
  "$_pkgname::https://github.com/Difrex/swaymgr/archive/${pkgver}.tar.gz"
)
md5sums=('0e3d28a23caaad5cd9e5a2072ec2f4f5')

build() {
  cd "$srcdir/$_pkgname-${pkgver}/${_pkgname}"
  export GOPATH="$srcdir/go"
  export GOBIN="$srcdir/go/bin"

  echo ":: Building binary"
  go build -v
  go install -v
}

package() {
  find "$srcdir/go/bin/" -type f -executable | while read filename; do
	install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
  done
}
