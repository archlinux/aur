# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgname="arbie"
_gitauthor="danisztls"
_gitbranch="main"

pkgname="${_pkgname}-git"
pkgver=v1.3.0.r3.g369fe50
pkgrel=3
pkgdesc="Encrypted backup and synchronization tool"
arch=('any')
url="https://github.com/${_gitauthor}/${_pkgname}"
license=('MIT')
groups=()
depends=('bash' 'borg' 'gocryptfs' 'rclone' 'rsync' 'systemd')
makedepends=('git' 'make')
optdepends=('pass: standard password manager'
            'gopass: improved password manager')
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=arbie.install
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
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
