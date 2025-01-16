# Maintainer: Fabio J Matos Nieves <fabio.matos999@gmail.com>
pkgname=waytrogen
pkgver=0.5.7
pkgdesc='A lightning fast gui wallpaper setter written in Rust.'
depends=('ffmpeg' 'gtk4>=4.12.0' 'gettext' 'sqlite' 'glib2' 'gobject-introspection' 'graphene' 'harfbuzz' 'fribidi' 'fontconfig' 'libepoxy' 'libxi' 'libx11' 'libcloudproviders' 'tinysparql' 'libpng' 'libtiff' 'libjpeg-turbo' 'libxkbcommon' 'wayland' 'libxext' 'libxcursor' 'libxdamage' 'libxfixes' 'libxrandr' 'libxinerama' 'libthai' 'libthai' 'zlib' 'freetype2' 'libxrender' 'libxcb' 'pixman' 'util-linux-libs' 'libffi' 'pcre' 'graphite' 'expat' 'json-glib' 'libxml2' 'zstd' 'xz' 'lzo' 'libdatrie' 'bzip2' 'brotli' 'libxau' 'libxdmcp' 'icu')
url="https://github.com/nikolaizombie1/waytrogen"
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikolaizombie1/waytrogen/archive/refs/tags/"$pkgver".tar.gz")
pkgrel=1
makedepends=('rust' 'cargo' 'gcc' )
optdepends=('hyprpaper: hyprland wallpaper setter'
	    'swybg: sway wallpaper setter'
	    'mpvpaper: animated wallpapers using mpv'
	    'swww: wallpaper setter with transitions')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
sha256sums=('SKIP')
license=('GPL-3.0-or-later')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package_waytrogen() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/locale/en/LC_MESSAGES/" locales/en/LC_MESSAGES/waytrogen.mo
  install -Dm0644 -t "$pkgdir/usr/share/locale/es/LC_MESSAGES/" locales/es/LC_MESSAGES/waytrogen.mo
  install -Dm0644 -t "$pkgdir/usr/share/glib-2.0/schemas/" org.Waytrogen.Waytrogen.gschema.xml
  install -Dm0644 -t "$pkgdir/usr/share/applications/" waytrogen.desktop
  mv README-Assets/WaytrogenLogo.svg README-Assets/waytrogen.svg
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" README-Assets/waytrogen.svg
}
