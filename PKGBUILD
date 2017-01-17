# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=rubber-git
pkgver=1.4.r776.675bfe3
pkgrel=1
epoch=1
pkgdesc="A wrapper for LaTeX and friends, latest git version."
arch=('any')
url="https://launchpad.net/rubber"
license=('GPL')
depends=('python2' 'texlive-core')
makedepends=('git' 'texinfo' 'texlive-plainextra')
provides=('rubber')
conflicts=('rubber')
replaces=('rubber-darcs' 'rubber-bzr')
source=('rubber::git+https://git.launchpad.net/rubber')
sha512sums=('SKIP')

pkgver() {
  cd rubber
  printf "%s.r%d.%s" \
    "$(perl -ne 'if (/^Version (?<v>[\d\.]+)/a) {print $+{v}; last}' NEWS)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd rubber
  python2 setup.py build
}

package() {
  cd rubber
  python2 setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1 \
    --mandir=share/man \
    --infodir=share/info
}

