# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgname="journal"
_gitauthor="danisztls"
_gitbranch="main"

pkgname="${_pkgname}-git"
pkgver=v1.1.2.r45.gd7136a9
pkgrel=1
pkgdesc="Note-taking and tasks management tool"
arch=('any')
url="https://github.com/${_gitauthor}/${_pkgname}"
license=('GPL3')
groups=()
depends=('bash' 'ripgrep' 'sed' 'fd' 'fzf' 'bat')
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/${_gitauthor}/${_pkgname}.git#branch=${_gitbranch}")
noextract=()
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use tags but fallback to revision
  ( set -o pipefail
    git describe --tags --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# build() {
# }

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

