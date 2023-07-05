# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=rose-pine-gtk-theme
pkgver=2.1.0
pkgrel=2
pkgdesc="A GTK theme with the Rose Pine colour palette."
arch=(any)
url="https://github.com/rose-pine/gtk"
license=('MIT')
source=("https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk3.tar.gz" "https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk4.tar.gz" "https://raw.githubusercontent.com/rose-pine/rose-pine-theme/e9388ed927c91d0f47726c410c3bb7964199dc48/license")
sha256sums=('8eeb7aa0cc966157551a26e3f8e2085bdf5ac7b519ad8a441665dacf4b38bcc2'
	'3a29cfd42ee6ac1f9557dc4498dbdf9f79d44c2af268943768bae1c7a4d00831'
	'SKIP')

_build() {
	local _name="$1"
	mkdir "gtk3/$_name-gtk/gtk-4.0"
	cp "gtk4/$_name.css" "gtk3/$_name-gtk/gtk-4.0/gtk.css"
}

build() {
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
	cd gtk3
	_package "rose-pine-gtk"
	_package "rose-pine-moon-gtk"
	_package "rose-pine-dawn-gtk"
}
