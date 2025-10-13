# Maintainer: Tomas S. <me+aur at wereii.cz>
# Controbutor: Martin Petrus <martin.petrus@example.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=pyfa
pkgver=2.64.2
pkgrel=1
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'python-wxpython' 'python-logbook' 'python-matplotlib' 'python-dateutil' 'python-setuptools' 'python-requests' 'python-sqlalchemy1.4' 'python-cryptography' 'python-markdown2' 'python-packaging' 'python-beautifulsoup4' 'python-yaml' 'python-roman' 'python-numpy' 'python-jose' 'python-requests-cache' 'webkit2gtk-4.1')
optdepends=()
options=(!strip)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pyfa-org/Pyfa/archive/v$pkgver.tar.gz
        pyfa.desktop
        pyfa-start.sh
       )

sha256sums=('22d17eab0f81000e1ffef7a95d04d16f8e74a0b7b6614f0891f98b8a539fb340'
            '4a9b543a8cbf4c4fef6758a4be2b3c9ff9aa6e7f8281d8b0efbfb0dcd39bc635'
            '0fa4a1cb835ddbb764957cd00426f9bfa52b17bcb6d5dc7428afc256da5e01da')

build() {
  cd "${srcdir}"/"${_distname}"

  PYTHONDONTWRITEBYTECODE=1 python db_update.py
  #find . -name "__pycache__" -type d -prune -exec rm -r "{}" \;
}

package() {
  install -dm755 "${pkgdir}"/usr/share/pyfa
  install -dm755 "${pkgdir}"/usr/share/licenses/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/config.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/db_update.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/eve.db "${pkgdir}"/usr/share/pyfa
  install -Dm755 "${srcdir}"/"${_distname}"/pyfa.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/README.md "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/version.yml "${pkgdir}"/usr/share/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/LICENSE "${pkgdir}"/usr/share/licenses/pyfa

  cp -a "${srcdir}"/"${_distname}"/eos "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/graphs "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/gui "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/imgs "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/service "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/utils "${pkgdir}"/usr/share/pyfa

  install -dm755 "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}"/"${_distname}"/imgs/gui/pyfa64.png "${pkgdir}"/usr/share/pixmaps/pyfa.png

  install -Dm644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop
  install -Dm755 "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa
}

