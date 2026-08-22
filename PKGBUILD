# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-quick-settings-scroll
pkgver=1.0.1
pkgrel=1
pkgdesc="Makes the GNOME Quick Settings menu scroll when it is taller than the screen"
arch=('any')
url="https://github.com/Disk-MTH/Quick-Settings-Scroll"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
source=("git+https://github.com/Disk-MTH/Quick-Settings-Scroll.git#tag=v$pkgver")
sha256sums=('673d0fb1795ab9d3185c110e65e08a24d364e8cc64a0f3c59725f6897af1062e')

build() {
  cd Quick-Settings-Scroll
  gnome-extensions pack \
    --extra-source=lib/ \
    --force
}

package() {
  cd Quick-Settings-Scroll
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
}
