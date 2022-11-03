# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

_pkgname=icu
pkgname=icu71
pkgver=71.1
pkgrel=1
pkgdesc='International Components for Unicode library (version 71)'
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python' 'clang' 'make' 'patch')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('1fd2a20aef48369d1f06e2bb74584877b8ad0eb529320b976264ec2db87420bae242715795f372dbc513ea80047bc49077a064e78205cd5e8b33d746fd2a2912')

build()
{
  cd "${_pkgname}/source"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin

  make
}

check()
{
  cd "${_pkgname}/source"

  make -k check
}

package()
{
  cd "${_pkgname}/source"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # install license
  install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
