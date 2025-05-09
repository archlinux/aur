# Maintainer: TheLightStream@proton.me
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sibren Vasse <arch @ sibrenvasse dot nl>
# Contributor: Preston Carpenter <APragmaticPlace@gmail.com>

pkgname=spotify-adkiller-git
pkgver=r188.416e544
pkgrel=3
pkgdesc='Your Party with Spotify - without ads!'
arch=('any')
url=https://github.com/thelightstream/Spotify-AdMuter
license=('GPL3')
depends=('libnotify' 'pulse-native-provider' 'spotify' 'xdotool' 'xorg-xprop')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+$url.git#branch=pactl")
sha512sums=('SKIP')

pkgver() {
  cd ${url##*/}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${url##*/}
  sed -i 's/\.sh//' spotify-wrapper.sh
  sed -i 's/\.sh//' 'Spotify (AdMuter).desktop'
}

package() {
  cd ${url##*/}
  install -D spotify-admuter.sh "$pkgdir"/usr/bin/spotify-admuter
  install -D spotify-wrapper.sh "$pkgdir"/usr/bin/spotify-wrapper
  install -Dm644 -t "$pkgdir"/usr/share/applications 'Spotify (AdMuter).desktop'
}

# vim:set ts=2 sw=2 et:
