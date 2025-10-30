# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-withme
pkgver=25.10.1
pkgrel=1
pkgdesc='Encrypted, peer-to-peer Git for two+ people'
arch=(any)
url="https://pypi.org/project/$pkgname"
license=(MIT)
_pydeps=(click
         humanize
         rich)
depends=(fowl
         magic-wormhole
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-hatchling)
checkdepends=(python-pytest)
_archive="${pkgname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('7e373523e96922dec6cd6f03eeb25b09d032c89f2913e6400abac02292bd3396')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
