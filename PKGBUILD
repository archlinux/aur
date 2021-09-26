# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf-git
pkgver=latest.build.r0.gac1498f
pkgrel=1
pkgdesc='Fairly Usable cli Filebrowser. dev/git version'
arch=('any')
url=https://github.com/ckath/fuf
license=('MIT')
depends=('ncurses' 'libx11')
makedepends=('git')
optdepends=('w3m: image previews')
conflicts=('fuf')
provides=('fuf')
install=fuf.install
source=("$pkgname::git+https://github.com/ckath/fuf.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/$pkgname"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fuf "$pkgdir/usr/bin/fuf"
  install -Dm755 scripts/open "$pkgdir/usr/lib/${pkgname%-git}/open"
  install -Dm755 scripts/preview "$pkgdir/usr/lib/${pkgname%-git}/preview"
  install -Dm644 completions/bash/fuf "$pkgdir/usr/share/bash-completion/completions/fuf"
  install -Dm644 completions/zsh/_fuf "$pkgdir/usr/share/zsh/site-functions/_fuf"
}
