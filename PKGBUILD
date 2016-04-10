# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-audio-output-switcher-git
pkgver=r21.5def796
pkgrel=3
pkgdesc="Adds a switch for choosing audio output to the system menu."
arch=('i686' 'x86_64')
url="https://github.com/anduchs/audio-output-switcher"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=("$pkgname::git+https://github.com/anduchs/audio-output-switcher#branch=ports2"
        "gnome-shell-version.patch")
sha256sums=('SKIP'
            'eb90f357bf6af150c19cae6d899a2506e3b429b430f335b66e475baf45829e83')

prepare() {
  cd "$pkgname"
  patch -p0 -i "$srcdir/gnome-shell-version.patch"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='audio-output-switcher@anduchs'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
}
