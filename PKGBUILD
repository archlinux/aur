# Maintainer: Gioele Rosana <gioelerosana at outlook dot it>
#
# Maintained in packaging/arch/aur/ of https://github.com/gioelerosana/xmap-studio
# and published here by packaging/arch/aur-publish.sh at every release:
# send changes there. The tarball is built by the project's CI, nothing is
# compiled on your machine.

pkgname=xmap-studio-bin
_pkgname=xmap-studio
pkgver=26.4.2
pkgrel=1
pkgdesc='Free and open-source mind map editor for .xmind files, with native LaTeX formulas'
arch=('x86_64')
url='https://github.com/gioelerosana/xmap-studio'
license=('MIT')
_electron=electron44
depends=("$_electron")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
_tarball="$_pkgname-$pkgver-linux-x86_64"
source=("$_tarball.tar.gz::$url/releases/download/v$pkgver/$_tarball.tar.gz"
        'xmap-studio.sh')
sha256sums=('544e70bfa2ffc127c06c2cb4a9811e77147c343f5d2c2d233adc17d3f576e582'
            'e1d01076568a7fc57e4202a4bd9c78148bf2d24e09a37ba2e8380b5828bbc0c1')

package() {
  cd "$_tarball"

  install -d "$pkgdir/usr/lib"
  cp -a "lib/$_pkgname" "$pkgdir/usr/lib/"
  cp -a share "$pkgdir/usr/"

  sed "s/@ELECTRON@/$_electron/" "$srcdir/xmap-studio.sh" > "$srcdir/xmap-studio.launcher"
  install -Dm755 "$srcdir/xmap-studio.launcher" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
