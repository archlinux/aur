# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Konstantin Gizdov <arch@kge.pw>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname='python2-nose'
_name="${pkgname#python2-}"
pkgver=1.3.7
pkgrel=13
pkgdesc='A discovery-based unittest extension (deprecated)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('LGPL2.1')
depends=(
  'python2'
  'python2-setuptools'
)
_tarname="${_name}-${pkgver}"
source=(
  "https://pypi.io/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"{,.asc})
b2sums=(
  '4bb479b2786f813f9e9a5fd401e30023a473a053ae013d7887be15af415422c09fb399af6058ae99ed65c5fa4da84eb274eb805e895ca74db159d952905f5be4'
  'SKIP')
validpgpkeys=(
  # John Szakmeister <john@szakmeister.net>
  '58B277C0D208F7AC460C07C84548B3A8C0D70C12')

build() {
  cd "${_tarname}"

  sed -e "s:man/man1:share/man/man1:g" \
      -i setup.py
}

package() {
  cd "${_tarname}"

  python2 setup.py install --prefix='/usr' --root="${pkgdir}"

  mv "${pkgdir}/usr/bin/nosetests" "${pkgdir}/usr/bin/nosetests2"
  rm -rf "${pkgdir}/usr/share"
}
