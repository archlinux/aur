# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-ufonormalizer-git
pkgname=(python-ufonormalizer-git python2-ufonormalizer-git)
_pkgname=ufoNormalizer
pkgver=0.1.r178.1ed0111
pkgrel=2
pkgdesc='A tool that will normalize the XML and other data inside of a UFO.'
arch=('any')
url='https://github.com/unified-font-object/ufoNormalizer'
license=('unknown')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("git+https://github.com/unified-font-object/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # generate version using the one in setup.py, the commit count and the commit hash
  printf "%s.r%s.%s" \
    "$(grep -oP '(?<=version=")[^"]+' setup.py)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package_python-ufonormalizer-git() {
  depends=('python')
  provides=('python-ufonormalizer-git')
  conflicts=('python-ufonormalizer')

  cd "${srcdir}/${_pkgname}"

  # build and install the package
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

  # remove the installed scripts to prevent conflicts between both packages
  rm -r "${pkgdir}/usr/bin"
}

package_python2-ufonormalizer-git() {
  depends=('python2')
  provides=('python2-ufonormalizer-git')
  conflicts=('python2-ufonormalizer')

  cd "${srcdir}/${_pkgname}"

  # build and install the package
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

  # remove the installed scripts to prevent conflicts between both packages
  rm -r "${pkgdir}/usr/bin"
}
