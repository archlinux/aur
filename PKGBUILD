# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=templates_parser
pkgdesc='Ada tools to create templated text streams, such as dynamic HTML documents.'
pkgver=27.0w
pkgrel=1

url='https://github.com/AdaCore/templates-parser'
arch=(x86_64)
license=(Apache-2.0)


depends=(gnatcoll-gmp langkit)

makedepends=(
  gprbuild
  python-setuptools
  python-mako
  python-funcy
  python-e3-core
  python-docutils
  python-sphinx
  python-sphinx_rtd_theme
  texlive-binextra
)


_srcdir="templates_parser-${pkgver}-20260324-1652A-src"


source=("https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/templates_parser-src.tar.gz")
sha256sums=('753e355a1cbd71996b161eb10253ad42a64f5a1588d2abc118bd3a541eabf359')


build() {
  cd "${_srcdir}"

  make PROCESSORS=0 \
       DEFAULT_LIBRARY_TYPE=relocatable \
       prefix=/usr \
       setup

  make PROCESSORS=0

  make build-doc \
    1>build-docs-warnings.log \
    2>build-docs-errors.log
}


package() {
  cd "${_srcdir}"

  make -j1 \
       prefix="${pkgdir}/usr" \
       install

  install -Dm644 COPYING3        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING3"
  install -Dm644 COPYING.RUNTIME "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.RUNTIME"
}