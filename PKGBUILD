# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-window-calls-git
pkgver=r59.b6be15f
pkgrel=1
pkgdesc="GNOME Extension for getting windows list in wayland"
arch=('any')
url="https://github.com/ickyicky/window-calls"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ickyicky/window-calls.git')
sha256sums=('SKIP')

pkgver() {
  cd window-calls
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd window-calls
  gnome-extensions pack --force
}

package() {
  cd window-calls
   _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
}
