# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=m2c
pkgver=r1332.g3478473
pkgrel=1
pkgdesc='MIPS, ARM, and PowerPC decompiler'
arch=(any)
url='https://github.com/matt-kempster/m2c'
license=(GPL-3.0-only)
depends=(
  python
  python-graphviz
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
source=("$pkgname::git+$url#commit=3478473441a1e6da75d6bf07629452f410390ef4")
sha512sums=('09cc2a96d935229b20b26b7451ed49b8a2b73ffd9b81d9df2bcd87b6750553b765647e32cfd2d4ef4175030a00df67663dbb2df0339aa5eba78fb1c6210444aa')
b2sums=('960da0693d174e84384b18126f3eb3cdf464368122883f7766e5a136eecd2387091e4ba32b624ff36d11c7ce447dac44c1e58270bb699fee7df9ed5182ce7a6b')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
