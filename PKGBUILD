# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: Jakub Jirutka <jakub@jirutka.cz>

pkgname=zzz
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple program to suspend or hibernate your computer"
arch=('x86_64')
url="https://github.com/jirutka/zzz"
license=("MIT")
depends=("glibc")
makedepends=("asciidoctor")
_tag=abff0e229b386ba60c1ba25868d480708114c72c
source=("git+${url}.git#tag=${_tag}")
sha256sums=('251a660688918f72d03714896aa442b185d48dde743c5144d9aa9df50700b449')

build() {
  cd "$pkgname"
  make CFLAGS="$CFLAGS -DZZZ_LOCK_FILE='\"/run/zzz.lock\"'"
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir" prefix=/usr sbindir=/usr/bin

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
}
