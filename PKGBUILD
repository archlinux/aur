# Maintainer: enova

# PKGBUILD forked from doas-sudo-shim-k [https://aur.archlinux.org/packages/doas-sudo-shim-k] by
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=doas-sudo-shim
pkgname=doas-sudo-shim
pkgver=0.2.0
pkgrel=1
pkgdesc="A shim for the sudo command that utilizes doas"
arch=(any)
url="https://github.com/jirutka/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo doas-sudo-shim-v doas-sudo-shim-k)
depends=(awk doas sh)
optdepends=('asciidoctor: manpage generator')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jirutka/doas-sudo-shim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee65fc0ddce47300dafaed1206806e6d84b26434472c5a155e7e2ea727bb1902')

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
