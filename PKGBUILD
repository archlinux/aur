# Maintainer:
# Contributor: asmeron@ublinux.com

pkgname=icu69
pkgver=69.1
pkgrel=2
pkgdesc='International Components for Unicode library (legacy version 69)'
url="http://www.icu-project.org/"
arch=('i686' 'x86_64')
license=(
  'LicenseRef-Unicode-3.0'
  'BSD-2-Clause'
  'BSD-3-Clause'
  'NAIST-2003'
)

depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)

source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('d4aeb781715144ea6e3c6b98df5bbe0490bfa3175221a1d667f3e6851b7bd4a638fa4a37d4a921ccb31f02b5d15a6dded9464d98051964a86f7b1cde0ff0aab7')

build() {
  cd "icu/source"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

package() {
  cd "icu/source"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
