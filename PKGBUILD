# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.9.0
pkgrel=1
pkgdesc="Lightweight, keyboard-oriented IDE"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtk4>=1:4.12.4" "libadwaita>=1:1.4.2" "gtksourceview5" "ttf-jetbrains-mono-nerd" "vte4")
makedepends=("make" "git" "crystal>=1.11.1" "shards>=0.14.0" "libyaml")
#optdepends=('ccls: C/C++ LSP support'
#            'bash-language-server: Bash LSP support'
#            'yaml-language-server: YAML LSP support'
#            'python-lsp-server: Python LSP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('5c5b4ec4e9ef456a95a02af0be780fd4af4d17c642080b84472fc106791d4a4d')

build() {
  cd "$srcdir/tijolo-$pkgver"
  make
}

package() {
  cd "$srcdir/tijolo-$pkgver"
  make install DESTDIR="${pkgdir}"
  rm -rf ${pkgdir}/usrshare
  install -D -m644 data/gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/io.github.hugopl.Tijolo.gschema.xml
}
