# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

_pkgname='stagit'
pkgname="${_pkgname}-git"
pkgver=0.9.4.r0.g75555cd
pkgrel=1
pkgdesc='Static site generator for git version control'
arch=('x86_64')
url='https://codemadness.org/stagit.html'
license=('MIT')
depends=('libgit2')
makedepends=('git')
optdepends=('git: scripting functionality')
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
