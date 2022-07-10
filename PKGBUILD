# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=python2-sip
_name="${pkgname#python2-}"
pkgver=4.19.25
pkgrel=1
pkgdesc='Legacy Python 2 bindings for C and C++ libraries'
arch=('x86_64')
url="https://riverbankcomputing.com/software/${_name}/download"
license=('custom' 'GPL2' 'GPL3')
depends=(
  'glibc'
  'python2'
)
_tarname="${_name}-${pkgver}"
source=("https://www.riverbankcomputing.com/static/Downloads/${_name}/${pkgver}/${_tarname}.tar.gz")
b2sums=('f92e105e6b30e871aea2883dc9cd459e4032fb139a9eaff153a3412a66b39df4d7ac985711a2693aee83195ff3850ae648bee4102f7fc3cc30d09885799f2b98')

build() {
  cd "${_tarname}"
  python2 configure.py \
    CFLAGS="${CFLAGS}" \
    LFLAGS="${LDFLAGS}" \
    --no-tools
  make
}

package() {
  cd "${_tarname}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
