# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-skill-youtube-transcript-git
_skillname="youtube-transcript"
pkgver=r24.75d32a3
pkgrel=1
pkgdesc='Pi coding agent skill for fetching YouTube video transcripts'
arch=('any')
url='https://github.com/badlogic/pi-skills'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('pi-skill-youtube-transcript')
conflicts=('pi-skill-youtube-transcript')
source=('git+https://github.com/badlogic/pi-skills.git')
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pi-skills"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/pi-skills/youtube-transcript"
  npm install --omit=dev --no-audit --no-fund --ignore-scripts
}

package() {
  local skilldir="$pkgdir/usr/share/pi/skills/${_skillname}"

  install -dm755 "$skilldir"
  cp -a "$srcdir/pi-skills/youtube-transcript/." "$skilldir/"
}
