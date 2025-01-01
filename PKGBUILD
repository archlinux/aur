pkgname=groundcoverify-git
pkgver=0.2.1.r2.g9d6e2b4
pkgrel=2
pkgdesc="A simple python script which uses DeltaPlugin to turn regular groundcover in morrowind plugins into openmw-style groundcover."
arch=('i686' 'x86_64')
url="https://gitlab.com/bmwinger/groundcoverify"
license=('GPL')
depends=(delta-plugin python)
makedepends=(git)
provides=(groundcoverify)
source=('git+https://gitlab.com/bmwinger/groundcoverify')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/groundcoverify"
	_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
	_numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
	_hash="$(git rev-parse --short HEAD)"
	printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

package() {
	cd "${srcdir}/groundcoverify"
	install -Dm0755 -t "$pkgdir/usr/bin/" "groundcoverify.py"
	install -Dm0755 -t "$pkgdir/usr/share/groundcoverify/" "groundcoverify.toml"
}
