# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from doas-sudo-shim [https://aur.archlinux.org/packages/doas-sudo-shim] by
# Maintainer: Jakub Jirutka <jakub@jirutka.cz>
_pkgname=doas-sudo-shim
pkgname=doas-sudo-shim-k
pkgver=0.1.2.1
pkgrel=2
pkgdesc="Sudo wrapper which wields doas (includes -k flag to ensure makepkg compatibility!)"
arch=(any)
url="https://github.com/fclivaz42/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo doas-sudo-shim)
depends=(awk doas sh)
optdepends=('asciidoctor: manpage generator')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mckaygerhard/doas-sudo-shim/archive/refs/tags/v0.1.2.1.tar.gz")
sha256sums=('32719b1bd71d9f47137723ca8fd40c276aff728a910624bb38e35c66d4f132bc')

if [ -n "`pacman -Qs asciidoctor`" ]; then
  build() {
    cd "$_pkgname-$pkgver" 
    make man
  }
  package() {
    cd "$_pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
  }
else
  package() {
    echo "asciidoctor not installed!" && cd "$_pkgname-$pkgver"
    install -Dm755 sudo "${pkgdir}/usr/bin/sudo"
  }
fi
