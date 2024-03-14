# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=ctcache-git
_gitname=ctcache
pkgver=r161.46ba46a
pkgrel=1
pkgdesc='Cache for clang-tidy static analysis results'
url='https://github.com/matus-chochlik/ctcache/'
arch=('any')
license=('BSL-1.0')
depends=()
optdepends=('python-redis: for redis backend')
conflicts=('ctcache' 'ctcache-git')
provides=('ctcache')
source=('git+https://github.com/matus-chochlik/ctcache.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$_gitname/clang-tidy-cache" --target-directory "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$_gitname/clang-tidy-cache-server" --target-directory "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$_gitname/clang-tidy" --target-directory "$pkgdir/share/clang-tidy-cache/clang-tidy"
}
