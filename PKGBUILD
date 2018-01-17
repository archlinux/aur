# Maintainer: vltr <rkuesters@gmail.com>
pkgname=citus-git
pkgver=v6.1.0.rc2.833.raee0be88
pkgrel=1
pkgdesc="Scalable PostgreSQL for multi-tenant and real-time workloads"
url="https://github.com/citusdata/citus"
arch=('any')
license=('AGPL-3.0')
depends=('postgresql')
makedepends=('postgresql-libs' git)
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/citusdata/citus")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # credits for the "version snippe"t to the `pyenv-virtualenv-git` package author in aur
  # Get the first part of the latest tag and append the current revision
  echo "$(git describe --long --tags | sed 's/\(^.*\)-.*.*/\1/;s/-/./g').r$(git log --pretty=format:'%h' -n 1)"
}

build() {
	cd "$pkgname"
	./configure
	make
}

package() {
	cd "$pkgname"
	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

