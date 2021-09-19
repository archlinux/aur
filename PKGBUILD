# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase=scrap_engine-git
pkgname=('python-scrap_engine-git' 'lil_t-git')
pkgver=1.0.0
pkgrel=1
arch=(any)
url="https://github.com/lxgr-linux/scrap_engine"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/scrap_engine')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

package_python-scrap_engine-git() {
  provides=('python-scrap_engine')
  depends=('python')
  pkgdesc="Python scrap_engine module"
  cd "${srcdir}/$pkgbase"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/scrap_engine/LICENSE"
}

package_lil_t-git() {
  provides=('lil_t')
  depends=('python' 'python-scrap_engine-git')
  pkgdesc="Experimantal jump and run game written in python3"
  cd "${srcdir}/$pkgbase"
  install -Dm0755 -t "$pkgdir/usr/bin" "examples/lil_t_endless.py"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/lil_t/LICENSE"
}
