# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_name=pandoc-plantuml-filter
pkgname=${_name}-py-git
pkgver=v0.1.1.r7.g3226959
pkgrel=1
pkgdesc='Pandoc filter for PlantUML code blocks, python version'
arch=('any')
url='https://github.com/timofurrer/pandoc-plantuml-filter'
license=('MIT')
depends=('python' 'python-pandocfilters')
makedepends=('python-setuptools')
conflicts=('pandoc-plantuml-filter' 'pandoc-plantuml-filter-py')
replaces=('pandoc-plantuml-filter' 'pandoc-plantuml-filter-py')
provides=('pandoc-plantuml-filter-py')
source=("${_name}::git+${url}.git")
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_name}"
  _version=$(python setup.py -V)
  ( set -o pipefail
  git describe --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
