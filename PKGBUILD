# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sibren Vasse <arch @ sibrenvasse dot nl>
# Contributor: Preston Carpenter <APragmaticPlace@gmail.com>

pkgname=spotify-adkiller-git
pkgver=r177.2dabf81
pkgrel=1
pkgdesc='Your Party with Spotify - without ads!'
arch=('any')
url=https://github.com/SecUpwN/Spotify-AdKiller
license=('GPL3')
depends=('libnotify' 'pulseaudio' 'spotify' 'xdotool' 'xorg-xprop')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${url##*/}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${url##*/}
  sed -i 's/\.sh//' spotify-wrapper.sh
  sed -i 's/\.sh//' 'Spotify (AdKiller).desktop'
}

package() {
  cd ${url##*/}
  install -D ${pkgname%-*}.sh "$pkgdir"/usr/bin/${pkgname%-*}
  install -D spotify-wrapper.sh "$pkgdir"/usr/bin/spotify-wrapper
  install -Dm644 -t "$pkgdir"/usr/share/applications 'Spotify (AdKiller).desktop'
}

# vim:set ts=2 sw=2 et:
