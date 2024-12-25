# Maintainer: aljustiet <aljustiet@tutamail.com
pkgname=kanata-git
pkgver=r1191.81e3a0ae
pkgrel=1
pkgdesc="Improve keyboard comfort and usability with advanced customization (cmd build)"
arch=('x86_64')
url="https://github.com/jtroo/kanata"
license=('LGPL-3.0')
depends=('glibc' 'gcc-libs' 'libevdev')
makedepends=('cargo' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('kanata')
conflicts=('kanata-bin' 'kanata')
source=('git+https://github.com/jtroo/kanata.git')
sha256sums=('SKIP')

pkgver() {
	cd kanata
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd kanata
	cargo build --release --features cmd
}

package() {
  install -Dm755 kanata/target/release/kanata "$pkgdir/usr/bin/kanata"
}
