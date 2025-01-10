# Maintainer: naether.markus[at]gmail.com

pkgname=gto
pkgver=1.7.2
pkgrel=1
pkgdesc="Git Tag Ops. Turn your Git repository into Artifact Registry or Model Registry."
arch=('any')
url="https://github.com/iterative/gto"
license=('Apache-2.0')
depends=(
	'python'
	'python-scmrepo'
    'python-typer'
    'python-rich'
    'python-pydantic'
    'python-ruamel-yaml'
    'python-semver'
    'python-entrypoints'
    'python-tabulate'
    'python-funcy'
    'python-shortuuid'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("gto-${pkgver}::git+${url}.git#tag=${pkgver}")
sha256sums=(
	'SKIP'
)

build() {
	cd "${srcdir}/gto-${pkgver}"
	python -m build --wheel --skip-dependency-check #--no-isolation
}

package() {
    cd "$srcdir/gto-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gto"
}
