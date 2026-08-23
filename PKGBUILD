# Maintainer: chen-shuhan <2502820816@qq.com>
# Contributor: chen-shuhan <2502820816@qq.com>

pkgname=curfew
pkgver=2.9.1
pkgrel=1
pkgdesc="Curfew - 电脑定时关机/睡眠工具，智能管理电脑使用时间"
arch=('any')
url="https://github.com/aura-deak/Curfew"
license=('GPL3')
depends=('python' 'python-flask' 'python-chinese-calendar' 'python-daemon' 'python-plyer')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'git')
provides=('curfew')
conflicts=('curfew')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5e301be6d44dc3408ba2e97c0d5c548b1e4a8d151d99f573fef286f3953be1f')

_github_repo=Curfew

build() {
  cd "$srcdir/${_github_repo}-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_github_repo}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
