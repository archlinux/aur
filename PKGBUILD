# $id$
# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=('python2-biopython' 'python-biopython')
_pkgname=biopython
pkgver=1.63
pkgrel=3
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('i686' 'x86_64')
url="http://www.biopython.org"
license=('custom')
depends=('python2-numpy' 'python-numpy')
source=(http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz)
md5sums=('09c58433150849b131d2d9bbfdf342d3')

prepare() {
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2/"
  
  cd "${srcdir}/${_pkgname}-${pkgver}-py2/"
  # change python to python2
  sed -i "s|python|python2|g" "Bio/bgzf.py"
  sed -i "s|python|python2|g" "Bio/DocSQL.py"
  sed -i "s|python|python2|g" "Bio/kNN.py"
  sed -i "s|python|python2|g" "Bio/LogisticRegression.py"
  sed -i "s|python|python2|g" "Bio/PDB/parse_pdb_header.py"
  sed -i "s|python|python2|g" "Bio/PDB/PDBList.py"
  sed -i "s|python|python2|g" "Bio/Restriction/__init__.py"
  sed -i "s|python|python2|g" "Bio/Restriction/PrintFormat.py"
  sed -i "s|python|python2|g" "Bio/Restriction/Restriction.py"
  sed -i "s|python|python2|g" "Bio/SeqUtils/__init__.py"
  sed -i "s|python|python2|g" "Bio/UniProt/GOA.py"
  sed -i "s|python|python2|g" "Bio/Wise/__init__.py"
  sed -i "s|python|python2|g" "Bio/Wise/dnal.py"
  sed -i "s|python|python2|g" "Bio/Wise/psw.py"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-py2/"
  python2 setup.py build
  
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python setup.py build
}

package_python2-biopython() {
  depends=('python2-numpy')
  optdepends=('python2-reportlab: for pdf graphics code'
              'mysql-python: for BioSQL module')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2/"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-biopython() {
  depends=('python-numpy')
  
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

