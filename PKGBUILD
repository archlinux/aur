# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='stagit-gopher'
pkgname="${_pkgname}-git"
pkgver=0.9.4.r0.g218c16a
pkgrel=1
pkgdesc='Static gopher site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit-gopher.html'
license=('MIT')
depends=('libgit2')
makedepends=('git')
optdepends=('geomyidae: small c-based gopherd'
            'git: scripting functionality')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://git.codemadness.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${_pkgname}" install
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
