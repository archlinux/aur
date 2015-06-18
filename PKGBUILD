# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-audio-output-switcher-git
pkgver=r21.5def796
pkgrel=1
pkgdesc="Adds a switch for choosing audio output to the system menu."
arch=('i686' 'x86_64')
url="https://github.com/anduchs/audio-output-switcher"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=("$pkgname::git+https://github.com/anduchs/audio-output-switcher#branch=ports2"
        "gnome-shell-3.16.patch")
sha256sums=('SKIP'
            'bf075f0a396e27af2c71ea9fcdb465504e544ffbcf0e31183f6b76098afdc48d')

prepare() {
  cd "$pkgname"
  patch -p0 -i "$srcdir/gnome-shell-3.16.patch"
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
