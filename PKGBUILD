# Maintainer: Hunter Brodie <hunterbrodie@gmail.com>
pkgname='aurora-git'
pkgver=r2.1711939
pkgrel=1
pkgdesc="Yet another wrapper for pacman to access the AUR written in Rust."
arch=('x86_64')
url="https://gitlab.com/hunterbrodie/aurora"
license=('GPL')
depends=('opendoas' 'git' 'pkgfile')
makedepends=('cargo')
source=('aurora-git::git+https://gitlab.com/hunterbrodie/aurora.git')
md5sums=('SKIP')

pkgver()
{
	cd "$srcdir/${pkgname%-VCS}"
  
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "$pkgname"
	cargo build --release --locked --all-features --target-dir=target
}

package()
{
	cd "$pkgname"
	install -Dm 755 target/release/aurora -t "${pkgdir}/usr/bin"
}
