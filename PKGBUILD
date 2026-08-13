# Maintainer: Muhammad Hamza <github.com/Hamza-b93>
# "anvil" was already taken on the AUR by an unrelated project, hence the
# pkgname suffix below; the upstream project and repo are still just Anvil.
pkgname=anvil-manager
pkgver=0.7.3
pkgrel=1
pkgdesc="A self-hosted pacman GUI"
arch=('any')
url="https://github.com/Hamza-b93/anvil"
license=('MIT')
depends=('python' 'python-fastapi' 'uvicorn' 'pacman-contrib')
optdepends=('yay: AUR search/install/remove support'
            'polkit: graphical authentication for privileged actions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('anvil')
conflicts=('anvil')
# GitHub's archive tarball keeps the repo's own casing (Anvil-$pkgver), not
# $pkgname-$pkgver — the two diverge now that pkgname != the repo name.
_srcdir="Anvil-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hamza-b93/anvil/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf89b6e2aa533876acf388e6ee5a9898f77f0391b16350e0138a51bafde49ee8')

build() {
  cd "$_srcdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
