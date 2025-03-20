# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=ocgraph
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to visualize object code as control flow graph"
arch=(any)
url="https://pypi.org/project/ocgraph"
license=(MPL-2.0)
makedepends=("python" "python-pip")
depends=("python" "python-graphviz")

build() {
  pip install --no-deps --target="$pkgname" $pkgname==$pkgver
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/$pkgname/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
