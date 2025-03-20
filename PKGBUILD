# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.5.0
pkgrel=2
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=("Mozilla Public License Version 2.0")
depends=("python>=3.10" "clang>=19.1.0")

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
