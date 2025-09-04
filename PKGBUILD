# Maintainer: enova

# PKGBUILD forked from doas-sudo-shim-k [https://aur.archlinux.org/packages/doas-sudo-shim-k] by
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=doas-sudo-shim
pkgname=doas-sudo-shim-v
pkgver=0.1.2v
pkgrel=1
pkgdesc="Sudo wrapper which wields doas (includes -k flag and -v flag to ensure makepkg and yay compatibility!)"
arch=(any)
url="https://github.com/Enovale/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo doas-sudo-shim)
depends=(awk doas sh)
optdepends=('asciidoctor: manpage generator')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Enovale/doas-sudo-shim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da5580f24274f8ed2e87da54252463c98602795ad29dd5b7261502c70ec5dc97')

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
