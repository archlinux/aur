# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bat-extras
pkgver=2021.08.21
pkgrel=1
pkgdesc="Bash scripts that integrate bat with various command line tools"
arch=('any')
url="https://github.com/eth-p/bat-extras"
license=('MIT')
depends=('bat' 'bash')
optdepends=(
  'git: required for batdiff script'
  'ripgrep: required for batgrep script'
  'man-db: required for batman script'
  'ncurses: optional for batdiff script'
  'git-delta: optional for batdiff script'
  'fzf: optional for batman script'
  'exa: optional for batpipe script'
  'entr: optional for batwatch script'
  'prettier: various code formatting for prettybat script'
  'shfmt: bash formatting for prettybat script'
  'rustfmt: Rust formatting for prettybat script'
  'clang: C / C++ / Objective-C formatting for prettybat script'
  'python-black: Python formatting for prettybat script'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6df434fb800f1c0c56731237801348d97d6fbb5652b2315b64f9c172533de01e59a1ec37f11d5d6d9ac91aaf389185b275554deb8ae598c203a5c1419c462d27')

package() {
  cd "$pkgname-$pkgver"
  ./build.sh \
    --minify=none \
    --no-verify \
    --prefix="$pkgdir/usr" \
    --install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTING.md README.md doc/*
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
