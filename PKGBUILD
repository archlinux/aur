# Maintainer: Joseph R. Quinn <quinn dot josephr at protonmail dot com>

pkgname='fsharp-git'
pkgver=10.2.3.r6.g24c798bfc
pkgrel=1
pkgdesc='The F# Compiler, Core Library & Tools (F# Software Foundation Repository) - Git Version'
arch=('any')
url='https://fsharp.org/'
license=('MIT')
depends=('mono>=6.0' 'msbuild>=15')
makedepends=('git')
provides=('fsharp')
conflicts=('fsharp')
source=("$pkgname::git+https://github.com/fsharp/fsharp")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  prefix='/usr' make
}

package() {
  cd "$pkgname"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
