# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-qt-base-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.8
pkgrel=1
# the prebuilt library links private Qt headers, so each arch only runs against the Qt it was built with
_qtver_x86_64=6.12.0
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
         wayland)
depends_x86_64=("qt6-base=$_qtver_x86_64"
                "qt6-declarative=$_qtver_x86_64"
                "qt6-wayland=$_qtver_x86_64")
depends_aarch64=("qt6-base=$_qtver_aarch64"
                 "qt6-declarative=$_qtver_aarch64"
                 "qt6-wayland=$_qtver_aarch64")
optdepends=('qt6-svg: svg images and icons')
provides=("$_pkgname=$pkgver" libdux-qt-base.so)
conflicts=("$_pkgname" "$_pkgname-git")
source=("LICENSE-$pkgver::$_urlraw/LICENSE"
        "LICENSE-GPL-$pkgver::$_urlraw/LICENSE-GPL")
source_x86_64=("$_pkgname-$pkgver-qt$_qtver_x86_64-x86_64.tar.zst::$_urlrel/$_pkgname-$pkgver-qt$_qtver_x86_64-x86_64.tar.zst")
source_aarch64=("$_pkgname-$pkgver-qt$_qtver_aarch64-aarch64.tar.zst::$_urlrel/$_pkgname-$pkgver-qt$_qtver_aarch64-aarch64.tar.zst")
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')
sha256sums_x86_64=('a9e77d5470a7e16be58986697338a145896a2956d53648156535ae9d98485dab')
sha256sums_aarch64=('918369108a9948fa7fed47b11d79c80ad5faf1b512b4141f30bf7cc1f4d6216f')

package() {
	cp -a "$srcdir/usr" "$pkgdir/"
	install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "LICENSE-GPL-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"
}
