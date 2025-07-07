# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-xwayland-indicator
_uuid=xwayland-indicator@swsnr.de
pkgver=48.6
pkgrel=1
pkgdesc="Determine whether a window in GNOME uses xwayland"
arch=('any')
url="https://codeberg.org/swsnr/gnome-shell-extension-xwayland-indicator"
license=('EUPL-1.2')
depends=('gnome-shell')
makedepends=(
  'git'
  'just'
  'npm'
)
source=("git+https://codeberg.org/swsnr/gnome-shell-extension-xwayland-indicator.git#tag=v$pkgver")
sha256sums=('7747a04a0406a9ce08aa1bbff49862092dba3285a626834a54d79c1e4bfe7ed0')

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  just pack
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
