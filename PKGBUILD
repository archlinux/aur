# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=asp
pkgver=5
pkgrel=3
pkgdesc="Arch Linux build source file management tool"
arch=(any)
url="https://github.com/falconindy/asp"
license=(MIT)
depends=(awk bash jq git libarchive)
makedepends=(asciidoc)
source=("git+https://github.com/falconindy/asp?signed#tag=v$pkgver" "use-github-git.patch")
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')  # Dave Reisner
md5sums=('SKIP'
         '106dfaab78c23fdf863ece9516cb0453')

prepare() {
  patch -Np0 -i ${srcdir}/use-github-git.patch
}

build() {
  make -C asp
}

package() {
  make -C asp PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 asp/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
