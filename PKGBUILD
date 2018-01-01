# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=discogs-wantlist-cli-git
_gitname=discogs-wantlist-cli
pkgver=r1.87b4f5e
pkgrel=1
pkgdesc="Extract releases from Discogs user wantlist without duplicates"
arch=('any')
url="https://github.com/voronianski/discogs-wantlist-cli"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('discogs-wantlist-cli')
conflicts=('discogs-wantlist-cli')
options=(!emptydirs)
source=('git://github.com/voronianski/discogs-wantlist-cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Fix error with npm5 issue
  npm pack
}

package() {
  cd "${srcdir}/${_gitname}"

  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" *.tgz
}

# vim:set ts=2 sw=2 et:
