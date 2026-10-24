# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-quick-settings-scroll
pkgver=1.1.0
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
sha256sums=('683f9ccfbc06cbcfce640b3f168d15359676b0b73a949e6d1556ed9add20c322')

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
