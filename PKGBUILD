# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgname="fzfx"
_gitauthor="danisztls"
_gitbranch="main"

pkgname="${_pkgname}-git"
pkgver=v1.3.2.r6.gc5b5787
pkgrel=1
pkgdesc="Opinionated wrapper that extends FZF."
arch=('any')
url="https://github.com/${_gitauthor}/${_pkgname}"
license=('MIT')
groups=()
depends=('bash' 'fzf' 'fd' 'ripgrep' 'bat')
makedepends=('git')
optdepends=('bat: improved text preview'
            'evince: preview pdfs'
            'mpv: preview videos'
            'feh: preview pictures'
            'grc: colorize ps'
            'tree: improved dir preview'
            'ripgrep-all: fulltext search blobs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 fzfx "${pkgdir}/usr/bin/fzfx"
  install -vDm 644 ignore "${pkgdir}/usr/share/${_pkgname}/ignore"
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
