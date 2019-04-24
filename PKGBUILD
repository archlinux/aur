# Maintainer: Jonas Gierer <jgierer12@gmail.com>

pkgname=gnome-shell-extension-do-not-disturb
pkgver=2.0.7
# Manually update SHA of specified version for now
# See https://github.com/pop-os/gnome-shell-extension-do-not-disturb/issues/5
_pkgver_sha=02a6e42607e313777449f83ff775057a28a0861c
pkgrel=1
pkgdesc="Enable or disable do not disturb mode"
arch=(any)
url="https://github.com/pop-os/gnome-shell-extension-do-not-disturb"
license=(MIT)
depends=('gjs' 'glib2')
conflicts=(gnome-shell-extension-do-not-disturb-git)
source=(
  "https://github.com/pop-os/gnome-shell-extension-do-not-disturb/archive/${_pkgver_sha}.tar.gz"
  "https://raw.githubusercontent.com/pop-os/gnome-shell-extension-do-not-disturb/${_pkgver_sha}/LICENSE"
)
sha256sums=('a1692eee8e0e3f2c19ebda6e32aa9af982cb7c4f99142fbe414e947741f39b08'
            '5a2c13b830017acb996f089bf838585c42b221574636b8273392b5c8db8a06af')

build() {
  cd "${pkgname}-${_pkgver_sha}"
  make
}

package() {
  cd "${pkgname}-${_pkgver_sha}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
