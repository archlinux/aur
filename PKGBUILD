# Maintainer: Fabio J Matos Nieves <fabio.matos999@gmail.com>
pkgname=waytrogen
pkgver=0.7.4
pkgdesc='A lightning fast gui wallpaper setter written in Rust.'
depends=('ffmpeg' 'gtk4>=4.12.0' 'gettext' 'sqlite' 'glib2' 'gobject-introspection' 'graphene' 'harfbuzz' 'fribidi' 'fontconfig' 'libepoxy' 'libxi' 'libx11' 'libcloudproviders' 'tinysparql' 'libpng' 'libtiff' 'libjpeg-turbo' 'libxkbcommon' 'wayland' 'libxext' 'libxcursor' 'libxdamage' 'libxfixes' 'libxrandr' 'libxinerama' 'libthai' 'libthai' 'zlib' 'freetype2' 'libxrender' 'libxcb' 'pixman' 'util-linux-libs' 'libffi' 'pcre' 'graphite' 'expat' 'json-glib' 'libxml2' 'zstd' 'xz' 'lzo' 'libdatrie' 'bzip2' 'brotli' 'libxau' 'libxdmcp' 'icu' 'bash' )
url="https://github.com/nikolaizombie1/waytrogen"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikolaizombie1/waytrogen/archive/refs/tags/"$pkgver".tar.gz")
pkgrel=1
conflicts=('waytrogen-bin')
makedepends=('meson' 'ninja' 'rust' 'cargo' 'gcc' )
optdepends=('hyprpaper: hyprland wallpaper setter'
	    'swaybg: sway wallpaper setter'
	    'mpvpaper: animated wallpapers using mpv'
	    'swww: wallpaper setter with transitions')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('SKIP')
license=('Unlicence')
options=(!'debug')

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  meson setup --prefix=/usr build
  meson compile -C build
}

package_waytrogen() {
  sudo rm -f /usr/share/icons/hicolor/scalable/apps/waytrogen.svg
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
