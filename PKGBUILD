# Maintainer: Gunther Klessinger gk<at>axiros<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=mdv
pkgdesc='Styled Terminal Markdown Viewer'
url="https://github.com/axiros/terminal_markdown_viewer"
pkgname="python-${_name}-git"
pkgver=1.6.3.r81.g80f333b
pkgrel=1
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-markdown' 'python-tabulate' 'python-pygments' 'python-docopt')
conflicts=( 'terminal_markdown_viewer' )
license=('BSD')
source=("${_name}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_name}"
  _version=$(python setup.py -V)
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
