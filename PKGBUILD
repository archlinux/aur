# Maintainer: littzhch <2371050115@qq.com>
_pkgname=pacman-install-comments
pkgname=${_pkgname}-hook-git
pkgrel=1
pkgver=r8.2b1be4b
pkgdesc="Pacman hook for adding comments to explicitly installed packages"
arch=('any')
url="https://github.com/Bekaboo/pacman-install-comments"
license=('custom')
depends=(bash sed coreutils diffutils grep pacman)
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  	cd "$_pkgname"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	sed -i 's/etc\/pacman.d\/scripts/usr\/share\/libalpm\/scripts/g' 99-install-comments.hook
}

package() {
	cd "$_pkgname"
	install -Dm644 '99-install-comments.hook' "$pkgdir/usr/share/libalpm/hooks/99-install-comments.hook"
	install -Dm755 'install-comments-hook' "$pkgdir/usr/share/libalpm/scripts/install-comments-hook"
}
