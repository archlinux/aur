# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=rose-pine-gtk-theme
pkgver=2.2.0
pkgrel=1
pkgdesc="A GTK theme with the Rose Pine colour palette."
arch=(any)
url="https://github.com/rose-pine/gtk"
license=('MIT')
source=("https://raw.githubusercontent.com/rose-pine/rose-pine-theme/e9388ed927c91d0f47726c410c3bb7964199dc48/license" "https://github.com/rose-pine/gtk/archive/refs/tags/v2.2.0.tar.gz")
sha256sums=('fb2535bcb42729f0547691eea7feee12d6870d184d704a7a929513973974d7bd'
  'b1fb35a16a5a208747fdd5d2951102b9d80f470a545a73761753584f27e0f8b7')

_build() {
  local _name="$1"
  mkdir "gtk3/$_name-gtk/gtk-4.0"
  cp "gtk4/$_name.css" "gtk3/$_name-gtk/gtk-4.0/gtk.css"
}

build() {
  cd "gtk-$pkgver"
  _build "rose-pine"
  _build "rose-pine-dawn"
  _build "rose-pine-moon"
}

_package() {
  local _name="$1"
  install -d "$pkgdir/usr/share/themes/$_name/"
  cp -a --no-preserve=ownership "$_name"/ "$pkgdir/usr/share/themes/"
}

package() {
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "gtk-$pkgver"/gtk3
  _package "rose-pine-gtk"
  _package "rose-pine-moon-gtk"
  _package "rose-pine-dawn-gtk"
}
