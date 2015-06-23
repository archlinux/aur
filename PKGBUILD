# Maintainer: Agustin Ferrario 'py_crash' <agustin dot ferrario at hotmail dot com>

pkgname=guake-colors-solarized-git
pkgver=16
pkgrel=1
pkgdesc="Precision colors for machines and people. Guake integration."
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('Custom, FOSS')
depends=('guake')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=$pkgname.install
source=("git+https://github.com/coolwanglu/${pkgname%-*}"
        "dir.patch")
md5sums=('SKIP'
         '1e0761637fe55ee8de1904440be3c1ec')

pkgver() {
  cd "${srcdir}"/${pkgname%-*}

  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}"/${pkgname%-*}

  patch -p1 -i $srcdir/dir.patch

}


package() {
  cd "${srcdir}"/${pkgname%-*}

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 {,"${pkgdir}"/usr/bin/}set_dark.sh
  install -m 755 {,"${pkgdir}"/usr/bin/}set_light.sh

  install -dm 755 "${pkgdir}"/usr/share/guake/solarized-colors
  mv colors "${pkgdir}"/usr/share/guake/solarized-colors/

  install -dm 755 "${pkgdir}"/usr/share/guake/solarized-colors/doc
  install -m 644 {,"${pkgdir}"/usr/share/guake/solarized-colors/doc/}README.mkd

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 {,"${pkgdir}"/usr/share/licenses/${pkgname}/}LICENSE.mkd
}

# vim: ts=2 sw=2 et:
