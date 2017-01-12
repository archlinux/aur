# Maintainer: Yuri Pieters <magejohnyjtp at gmail dot com>

pkgname=spotify-adkiller-dns-block-git
pkgver=r82.1184e1e
pkgrel=1
pkgdesc='Experimental dns blocking from Spotify AdKiller'
arch=('i686' 'x86_64')
url=https://github.com/SecUpwN/Spotify-AdKiller
license=('GPL3')
depends=('spotify')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" 
        "${pkgname%-git}"
	"Spotify (dns-block).desktop")
sha512sums=('SKIP'
            '31670a77b13d5a38dcfe96ccf5892996800b76d683071a46f27f647e353ad0e6adf95e3b2fbad9871f6296fc374fdb793d374d53cb5fd899949e694f5d579fab'
            '3a38a5634ef8fb82212f44b021b614bbad2682129ec21a5e90fd00fc60f66da025cb61a3960d7b16b12e7d54773bb3cc4f9c14b867febabb3e2cd232a7455686')

pkgver() {
  cd "${url##*/}"
  git checkout -q dns-block
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${url##*/}"
  git checkout -q dns-block
}

build() {
  cd "${url##*/}"/experimental
  make
}

package() {
  install -D "${url##*/}"/experimental/dns-block.so -t "$pkgdir"/usr/lib/"${pkgname%-git}"/

  install -D "${pkgname%-git}" -t "$pkgdir"/usr/bin/

  install -D -m644 "Spotify (dns-block).desktop" -t "$pkgdir"/usr/share/applications/
}
