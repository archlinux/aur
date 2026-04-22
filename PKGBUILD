# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-skill-brave-search-git
_skillname="brave-search"
pkgver=r24.75d32a3
pkgrel=1
pkgdesc='Pi coding agent skill for Brave Search web search and content extraction'
arch=('any')
url='https://github.com/badlogic/pi-skills'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('pi-skill-brave-search')
conflicts=('pi-skill-brave-search')
source=('git+https://github.com/badlogic/pi-skills.git')
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pi-skills"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/pi-skills/brave-search"
  npm ci --omit=dev --no-audit --no-fund --ignore-scripts
}

package() {
  local skilldir="$pkgdir/usr/share/pi/skills/${_skillname}"

  install -dm755 "$skilldir"
  cp -a "$srcdir/pi-skills/brave-search/." "$skilldir/"
}
