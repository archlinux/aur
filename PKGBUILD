# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: hollma <hollma@users.noreply.github.com>

pkgname=sile-package-omikhleia-git
_project=omikhleia-sile-packages
pkgver=r132.ab974f4
pkgrel=1
pkgdesc="Omikhleia's packages and classes for The SILE Typesetter"
arch=(any)
url="https://github.com/Omikhleia/$_project"
license=(MIT)
depends=(sile)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
makedepends=(git)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	local _sharedir="$pkgdir/usr/share/sile/sile/"
	mkdir -p "$_sharedir"
	cp -R classes packages preambles "$_sharedir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/docs/$pkgname/" docs/*.pdf
}
