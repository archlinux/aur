# Maintainer: Daniel Sandman <revoltism@gmail.com>
# Co-Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=pachist-git
_gitname=pachist
pkgver=r51.3f5521b
pkgrel=1
pkgdesc="A small bash program to show installed package history in Arch Linux."
arch=('any')
url="https://github.com/shellkr/pachist"
license=('GPL3')
makedepends=('git')
provides=('pachist')
conflicts=('pachist')
source=("pachist::git+https://github.com/shellkr/pachist.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  install -D -m755 pachist -t "${pkgdir}/usr/bin"
  install -D -m644 zsh_pachist "${pkgdir}/usr/share/zsh/site-functions/_pachist"
  install -D -m644 bash_pachist "${pkgdir}/usr/share/bash-completion/completions/pachist"
  install -D -m644 pachist.8 -t "${pkgdir}/usr/share/man/man8"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README"
}

# vim:set ts=2 sw=2 et:
