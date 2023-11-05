# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe-git
_gitpkgname=pypipe
pkgver=r27.3da3c10
pkgrel=1
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache')
depends=('python')
makedepends=('git')
checkdepends=('python-pytest')
provides=('pypipe')
conflicts=('pypipe')
options=('!strip')

source=(
  "${_gitpkgname}::git+https://github.com/bugen/pypipe.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${_gitpkgname}"
  python -m pytest -v tests/
}

package() {
  cd "${srcdir}/${_gitpkgname}"

  echo >&2 'Packaging script'
  install -D -m 755 -T 'pypipe.py' "${pkgdir}/usr/bin/ppp"

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" docs/*

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
