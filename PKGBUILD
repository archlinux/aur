# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="python-bertini_real-docs"
pkgname="${_pkgname}-git"
pkgver=r1517.58a8faa
pkgrel=1
pkgdesc="HTML documentation for python-bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/bertini_real"
license=('custom:Bertini license')
makedepends=('git' 'python' 'python-sphinx' 'python-numpy' 'python-scipy'
             'python-sympy' 'python-matplotlib' 'python-algopy' 'python-trimesh'
             'python-dill' 'python-setuptools' 'python-glumpy')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="bertini_real"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python/docs"
  make html   
}

package() {
  cd "${srcdir}/${_pkgsrc}/python"
  install -d "${pkgdir}/usr/share/doc/python-bertini_real/examples"
  find "example" -mindepth 1 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-bertini_real/examples" \;
  
  cd "docs/_build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-bertini_real/{}" \;
}
