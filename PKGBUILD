# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-qt-base-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.73
pkgrel=3
# no qt version pins: they deadlock pacman -Syu against makepkg on every qt bump
_qtver_x86_64=6.12.1
_qtver_aarch64=6.12.0
pkgdesc='Quickshell QML runtime as a shared library with a C entry point (prebuilt)'
arch=(x86_64 aarch64)
url="https://github.com/duxlabs-dev/$_pkgname"
_urlraw="https://raw.githubusercontent.com/duxlabs-dev/$_pkgname/v$pkgver"
_urlrel="$url/releases/download/v$pkgver"
license=(LGPL-3.0-only)
depends=(gcc-libs
         glib2
         libdrm
         libglvnd
         libpipewire
         libxcb
         libxkbcommon
         mesa
         pam
         polkit
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
optdepends=('qt6-svg: svg images and icons')
provides=("$_pkgname=$pkgver" libdux-qt-base.so)
conflicts=("$_pkgname" "$_pkgname-git")
source=("LICENSE-$pkgver::$_urlraw/LICENSE"
        "LICENSE-GPL-$pkgver::$_urlraw/LICENSE-GPL")
source_x86_64=("$_pkgname-$pkgver-qt$_qtver_x86_64-x86_64.tar.zst::$_urlrel/$_pkgname-$pkgver-qt$_qtver_x86_64-x86_64.tar.zst")
source_aarch64=("$_pkgname-$pkgver-qt$_qtver_aarch64-aarch64.tar.zst::$_urlrel/$_pkgname-$pkgver-qt$_qtver_aarch64-aarch64.tar.zst")
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')
sha256sums_x86_64=('c45db54a659351a26ae4e387e680ca5b9a02ce92751cef0821408888235abafe')
sha256sums_aarch64=('dce13fef48e1b4e13c591e8b60ea10e1866d662a27d207dfe2bf07c261359796')

package() {
	cp -a "$srcdir/usr" "$pkgdir/"
	install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "LICENSE-GPL-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"
}
