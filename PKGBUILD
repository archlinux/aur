# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=gobi-loader
pkgver=0.7
pkgrel=6
pkgdesc='Loader for gobi wwan chipset firmware'
source=("https://github.com/kicer/gobi_loader/archive/a4fad69d205c6568f8f86fa69c63b5dd50285d05.zip")
url='http://www.codon.org.uk/~mjg59/gobi_loader'
arch=('i686' 'x86_64')
license=('GPL2')

sha256sums=('c3426e6ebb15c8504d7214b02aec3682592dde7bdff8bd1ca48fb93f065208c9')

build() {
  cd gobi_loader-a4fad69d205c6568f8f86fa69c63b5dd50285d05
  # fix firmware path
  sed -ri 's#/lib/#/usr/lib/#' 60-gobi.rules
  gcc $CFLAGS $LDFLAGS gobi_loader.c -o gobi_loader
}

package() {
  cd gobi_loader-a4fad69d205c6568f8f86fa69c63b5dd50285d05
  install -D -m744 gobi_loader "$pkgdir/usr/lib/udev/gobi_loader"
  install -D -m644 60-gobi.rules "$pkgdir/usr/lib/udev/rules.d/60-gobi.rules"
}
