# Maintainer: Joost Bremmer <joost@madeofmagicandwires.online>
# Contributor: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor (stable version)"
pkgver=1.5
pkgrel=1
arch=('any')
url="https://github.com/keylo99/pkgtop"
license=('GPL3')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.zip::https://github.com/keylo99/${pkgname}/archive/${pkgver}.zip")
sha256sums=('cc801ed409639aef3ceb1eb833cae35b1eebd0c00151c3aafdfb48de4ace5f2e')


build() {
  cd "$srcdir/${pkgname}-${pkgver}/src"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/src"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/local/bin/${pkgname%-git}"
}
