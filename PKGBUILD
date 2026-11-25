# Maintainer: Konrad Guzek <konrad at guzek dot uk>

pkgname=monocode-bin
pkgver=0.16.0 # renovate: datasource=github-releases depName=hardbeat920/monocode
pkgrel=1
pkgdesc='Desktop interface for AI coding agents (prebuilt)'
arch=('x86_64')
url='https://github.com/hardbeat920/monocode'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("monocode=$pkgver")
conflicts=('monocode')
options=('!strip' '!debug')
_deb="MonoCode_${pkgver}_amd64.deb"
source=(
  "monocode-$pkgver-LICENSE::https://raw.githubusercontent.com/hardbeat920/monocode/v$pkgver/LICENSE"
  "monocode-$pkgver-NOTICE::https://raw.githubusercontent.com/hardbeat920/monocode/v$pkgver/NOTICE"
)
source_x86_64=("$url/releases/download/v$pkgver/$_deb")
noextract=("$_deb")
sha256sums=('3333be61cff8f46a68a883978fff0a6a2a993c3f434396c54482413ce9f63416'
            '34dd91624ab87f2b5e30b068ce0ccc54e7980cda83b189946c65f868a17511a6')
sha256sums_x86_64=('517e62e168da247ade4532d2cd2acbba3c24991cd01dbc6feeb9d56b9a0b0c04')

package() {
  # Extract the payload only; never run the Debian maintainer scripts.
  bsdtar -xOf "$srcdir/$_deb" data.tar.gz | bsdtar -xf - -C "$pkgdir" usr
  install -Dm644 "$srcdir/monocode-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/monocode-$pkgver-NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
