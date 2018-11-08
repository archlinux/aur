# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Sam S <smls75@gmail.com>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgname=lscolors-git
_pkgname=LS_COLORS
pkgver=r259.03e66df
pkgrel=1
pkgdesc='Colorize the output of the "ls" shell command via LS_COLORS'
url='https://github.com/trapd00r/LS_COLORS'
arch=('any')
makedepends=('git')
license=('PerlArtistic')
install="$pkgname.install"
source=("git+https://github.com/trapd00r/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  dircolors -b LS_COLORS > dircolors.sh
  dircolors -c LS_COLORS > dircolors.csh
}

package() {
  cd "$_pkgname"

  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" LS_COLORS
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" dircolors.sh
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" dircolors.csh
  install -Dm644 README.markdown "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
