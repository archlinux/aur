# Maintainer: Franklyn Tackitt <aur@frank.af>
pkgname=covid
pkgver=1.1
pkgrel=1
pkgdesc="Archlinux now has COVID"
arch=("any")
url="https://gitweb.dragonflybsd.org/dragonfly.git/tree/HEAD:/usr.bin/covid"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitweb.dragonflybsd.org/dragonfly.git/blob_plain/1975d09eeb449df1192c97c0419380768b658a20:/usr.bin/covid/covid.1"
        "https://gitweb.dragonflybsd.org/dragonfly.git/blob_plain/1975d09eeb449df1192c97c0419380768b658a20:/usr.bin/covid/covid.c")
md5sums=('938bf94e0a1198042a935f950a27144c'
         '5c200c80ad18092cd5a2c603439a5c61')

prepare() {
  gzip -f9 covid.1
  sed -i -E 's/__unused/__attribute__((unused))/g' covid.c
}

build() {
	gcc -o covid covid.c
}

package() {
	install -Dm755 covid      "$pkgdir/usr/bin/covid"
	install -Dm644 covid.1.gz "$pkgdir/usr/share/man/man1/covid.1.gz"
}
