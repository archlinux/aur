# Maintainer: Adam Weld <weld@valvesoftware.com>
# Maintainer: Christian Marcheselli <christianm@valvesoftware.com>

pkgname=jupiter-fan-control
_srctag=20260902.1
pkgver=${_srctag//-/.}
pkgrel=2
arch=('any')
license=('MIT')
pkgdesc="Jupiter fan controller"
url='https://github.com/evlav/jupiter-fan-control/-/tree/$_srctag'
depends=('python-pyaml' 'python>=3.10')
sha512sums=('SKIP'
            'a6a68c6213741a852e641b0b1dc12de29a8787be3c1a92b364eeedfdce5e91d6a3052b3f01751b64d2784dd3f60443a1bb56ac7f4600dcbd1cbeb9738455a4a8')
makedepends=('git' 'rsync')

source=("git+https://github.com/evlav/jupiter-fan-control.git#tag=$_srctag"
        "7.2-fix.patch")

prepare() {
   cd "$srcdir"/jupiter-fan-control
   patch -Np1 -i "$srcdir"/7.2-fix.patch
}

package() {
   rsync -a --exclude 'README.md' --exclude 'pyproject.toml' "$srcdir"/jupiter-fan-control/* "$pkgdir"
}
