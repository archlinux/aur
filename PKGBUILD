# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="python-bertini_real-docs"
pkgver=1.7.1
_commit="bdd3757964b8b6d03615a0d7ca045886dbe962e8"
pkgrel=1
pkgdesc="HTML documentation for python-bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/bertini_real"
license=('custom:Bertini license')
makedepends=('python-bertini_real' 'python-sphinx')
_pkgsrc="bertini_real-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('3836db7d354fb979e9214a6ab131ed5cc6940d198c27bacb27ac7b654aba9fa0')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/python/bertini_real"
  sed -n "s/^__version_info__ = (\(.*\))/\1/p" "__about__.py" | sed "s/, /./g"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python/docs"
  make html   
}

package() {
  # cd "${srcdir}/${_pkgsrc}/python/example"
  # install -d "${pkgdir}/usr/share/doc/python-bertini_real/examples"
  # find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-bertini_real/examples/{}" \;
  
  cd "${srcdir}/${_pkgsrc}/python/docs/_build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-bertini_real/{}" \;
}
