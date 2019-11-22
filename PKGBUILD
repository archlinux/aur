# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litex-git
pkgver=4782
pkgrel=1
pkgdesc="Migen based SoC"
arch=(any)
url="https://github.com/enjoy-digital/litex"
license=('MIT')
groups=()
depends=('python' 'migen')
optdepends=('lm32-elf-binutils: lm32 soft core'
			'lm32-elf-gcc: lm32 soft core'
			'riscv64-unknown-elf-binutils: picorv32 and vexriscv soft cores'
			'riscv64-unknown-elf-gcc: picorv32 and vexriscv soft cores')
provides=('litex')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litex")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  rm -rf test/__init__.py
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

