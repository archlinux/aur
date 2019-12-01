pkgname=intelxed-git
_pkgname=xed
pkgver=20190821
pkgrel=1
pkgdesc="Software library for encoding and decoding X86 instructions."
url="https://github.com/intelxed/xed"
arch=('x86_64' 'i686')
license=('Apache2')
depends=('python')
makedepends=('git')
conflicts=('intelxed')
source=("git+https://github.com/intelxed/xed.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format="%cd" --date="format:%Y%m%d"
}

build() {
  git clone https://github.com/intelxed/mbuild ${srcdir}/mbuild
  cd ${srcdir}/${_pkgname}
  ./mfile.py install --shared
}

package() {
  cd $srcdir/${_pkgname}/kits/xed-install-base-*-lin-x86-64
  mkdir -p "$pkgdir/usr"
  cp -r include "$pkgdir/usr/"
  cp -r lib "$pkgdir/usr/"
}
