# Python package author: Thomas Wucher <thomas.wucher@gtd-gmbh.de>
pkgname=elf-checker
pkgver=1.0.0
pkgrel=2
pkgdesc="A tool to visualize and check where ELF sections are located in different types of binaries"
arch=(any)
url="https://pypi.org/project/elf-checker"
license=(MPL-2.0)
makedepends=("python" "python-pip")
depends=("python" "python-pyelftools")

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
