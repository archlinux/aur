# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Ancona <brunoanconasala@gmail.com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>

pkgname=goneovim-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.4
pkgrel=1
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
arch=(x86_64)
url="https://github.com/akiyosi/$_pkgname"
license=(MIT)
depends=(expat
         fontconfig
         freetype2
         gcc-libs
         glibc
         gtk3
         libglvnd
         libspeechd
         libx11
         libxcb
         neovim
         nspr
         nss
         postgresql-libs
         qt5-declarative
         qt5-quickcontrols2
         qt5-sensors
         qt5-speech
         qt5-svg
         qt5-tools
         qt5-wayland
         qt5-webengine
         qt5-websockets
         zlib)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_archive="${_pkgname}-v$pkgver-linux"
source=("$url/releases/download/v$pkgver/$_archive.tar.bz2"
        goneovim.desktop
        goneovim.ico)
sha256sums=('ce084ed8afb07344d4cba2ce83e28d035ded49bedb1feb25edd0430e40d04bc4'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/pixmaps/" goneovim.ico
	install -Dm0644 -t "$pkgdir/usr/share/applications/" goneovim.desktop
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/nvim/runtime/doc/" "runtime/doc/$_pkgname.txt"
}
