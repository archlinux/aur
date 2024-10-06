# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: scj <scj archlinux us>

pkgname="dnuos"
pkgver=1.0.11
pkgrel=7
pkgdesc="Music library list creator"
arch=('any')
url="https://bitheap.org/dnuos"
license=('GPL-2.0-or-later')
depends=('python2')
makedepends=('python2-setuptools')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://bitheap.org/dnuos/files/${_pkgsrc}.tar.gz"
        "testdata.zip::https://bitheap.org/dnuos/files/testdata.zip")
sha256sums=('bfadc736d769ff9414d23a2084807c77f3eabcd6306e230faa16db18754fda54'
            '19e012ffc2727daa0cc5ba859ff9387fbd250ce3ca6dc8921486943995ab4e88')

prepare() {
  cd "${srcdir}"
  cp -rf "testdata" "${_pkgsrc}/testdata"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  python2 setup.py test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 "README.txt"   "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -Dm644 "LISEZMOI.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.fr.txt"
  install -Dm644 "HACKING.txt"  "${pkgdir}/usr/share/doc/${pkgname}/HACKING.txt"
  install -Dm644 "COPYING.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
