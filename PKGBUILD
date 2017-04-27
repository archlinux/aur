# Maintainer: Yuri Pieters <magejohnyjtp at gmail dot com>

pkgname=spotify-adkiller-dns-block-git
pkgver=r82.1184e1e
pkgrel=2
pkgdesc='Experimental dns blocking from Spotify AdKiller'
arch=('i686' 'x86_64')
url=https://github.com/SecUpwN/Spotify-AdKiller
license=('GPL3')
depends=('spotify')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=dns-block" 
        "${pkgname%-git}"
	"${pkgname%-git}.desktop")
sha512sums=('SKIP'
            'e123b737cc4360eaf57f2fd75db733b735d61d4b738d32f93de93d94da246923b97c0c90541c6719593702292e0f746d2e60b8205ef45eacfd82901251dfae5c'
            '3a38a5634ef8fb82212f44b021b614bbad2682129ec21a5e90fd00fc60f66da025cb61a3960d7b16b12e7d54773bb3cc4f9c14b867febabb3e2cd232a7455686')

pkgver() {
  cd "${url##*/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${url##*/}"
}

build() {
  cd "${url##*/}"/experimental
  make
}

package() {
  install -D "${url##*/}"/experimental/dns-block.so -t "$pkgdir"/usr/lib/"${pkgname%-git}"/

  install -D "${pkgname%-git}" -t "$pkgdir"/usr/bin/

  install -D -m644 "${pkgname%-git}.desktop" -t "$pkgdir"/usr/share/applications/
}
