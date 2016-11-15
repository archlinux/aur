# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-series-git
pkgver=0.9.0.r1.ge16e8d1
pkgrel=1
pkgdesc="Git extension that tracks changes to a patch series over time"
arch=('i686' 'x86_64')
url="http://github.com/git-series/git-series"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo')
optdepends=()
provides=('git-series')
conflicts=('git-series')
source=("git+https://github.com/git-series/git-series.git")
md5sums=('SKIP')

pkgver() {
  git --git-dir="$srcdir/git-series/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/git-series"
  export CARGO_HOME="$srcdir"
  cargo build --release
}

package() {
  cd "$srcdir/git-series"
  install -m755 -D "target/release/git-series" "$pkgdir/usr/bin/git-series"
  install -D "git-series.1" "$pkgdir/usr/man/man1/git-series.1"
}

# vim:set ts=2 sw=2 et:
