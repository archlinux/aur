# Maintainer: chen-shuhan <2502820816@qq.com>
# Contributor: chen-shuhan <2502820816@qq.com>

pkgname=curfew
pkgver=2.7.1
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
sha256sums=('defedf0dbcb3ae84beee2d6c617d49085b1d263f98fe582e8d636c9e6340878e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # 安装 LICENSE 文件
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
