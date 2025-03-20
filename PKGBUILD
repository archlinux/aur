# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=occtre
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool for producing and collecting test coverage on assembler level"
arch=(any)
url="https://pypi.org/project/occtre"
license=(MPL-2.0)
makedepends=("python" "python-pip")
depends=("python" "python-tomlkit" "python-tabulate" "python-dataclass-binder")

build() {
  pip install --no-deps --target="occtre" occtre==$pkgver
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/$pkgname/* $pkgdir/"$sitepackages"
  mkdir -p $pkgdir/usr/bin
  ln -s $sitepackages/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
