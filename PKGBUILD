pkgname=grimaur-git
pkgver=r216.g17893eb
pkgrel=1
pkgdesc="Lightweight Arch package builder that builds from any git source"
arch=('any')
url="https://github.com/mackilanu/grimaur"

# _dev_url="https://github.com/h8d13/grimoire"
# _dev_branch="dot-cache"

license=('MIT')
depends=('python' 'git' 'base-devel')
provides=('grimaur' 'grimoire')
conflicts=('grimaur' 'grimoire')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	# always use git hash for version
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 grimoire "${pkgdir}/usr/bin/grimoire"
	sed -i "s/^__version__ = .*/__version__ = \"${pkgver}\"/" "${pkgdir}/usr/bin/grimoire"
}