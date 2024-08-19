# Maintainer: Alan Barros de Oliveira <alanbarros@protonmail.com>
pkgname=timepatrol-git
_pkgname=timepatrol
pkgver=r145.869a9b0
pkgrel=1
pkgdesc="BTRFS snapshot manager and rollback tool"
arch=(any)
url="https://github.com/abdeoliveira/timepatrol"
license=('GPL-3.0-or-later')
depends=(ruby btrfs-progs)
makedepends=(git)
optdepends=("bash-completion: for bash completions")
source=(git+"$url")
md5sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
package() {
	cd "$srcdir"/"$_pkgname" || exit
	install -Dm 755 timepatrol -t "$pkgdir"/usr/bin
	install -Dm 755 timepatrol-pacman -t "$pkgdir"/usr/share/libalpm/scripts
	install -Dm 644 05-timepatrol-pre.hook -t "$pkgdir"/usr/share/libalpm/hooks
	install -Dm 644 zz-timepatrol-post.hook -t "$pkgdir"/usr/share/libalpm/hooks
	install -Dm 644 config-example -t "$pkgdir"/etc/timepatrol
	install -Dm 644 completions/timepatrol -t "$pkgdir"/usr/share/bash-completion/completions
}
