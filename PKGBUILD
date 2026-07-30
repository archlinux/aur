# Maintainer: chen-shuhan <2502820816@qq.com>
# Contributor: chen-shuhan <2502820816@qq.com>

pkgname=curfew
pkgver=2.7.1.0
pkgrel=1
pkgdesc="Curfew - 电脑定时关机/睡眠工具，智能管理电脑使用时间"
arch=('any')
url="https://github.com/aura-deak/Curfew"
license=('GPL3')
depends=('python' 'python-flask' 'python-chinese-calendar' 'python-daemon')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs' 'git')
provides=('curfew')
conflicts=('curfew')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4515a8a0054417e15d1ec822768861e075f7bedcf5194ecfe08ad5cc69beef1')

_github_repo=Curfew

build() {
  cd "$srcdir/${_github_repo}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_github_repo}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # 安装 LICENSE 文件
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
