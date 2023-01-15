# Maintainer: Daniel Souza <aur@posix.dev.br>

_gitbranch=main
_gitauthor=danisztls
pkgname=fzfx-git
pkgver=v1.1.2.r0.ged3d2f1
pkgrel=3
pkgdesc="A wrapper to fzf that does specialized fuzzy searches"
arch=('any')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git+https://github.com/${_gitauthor}/${pkgname%-git}.git#branch=${_gitbranch}")
sha512sums=('SKIP')
depends=('fzf' 'fd' 'ripgrep' 'bat')
optdepends=('bat: improved text preview' 'evince: preview pdfs' 'mpv: preview videos' 'feh: preview pictures' 'grc: colorize ps' 'tree: improved dir preview' 'ripgrep-all: fulltext search blobs')
makedepends=(git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Use last tag
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  install -Dm755 fzfx "${pkgdir}/usr/bin/fzfx"
  install -vDm 644 ignore "${pkgdir}/usr/share/${pkgname%-git}/ignore"
  install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
