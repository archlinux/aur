# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=uim
pkgver=1.8.9
pkgrel=1
pkgdesc="Multilingual input method library"
url="https://github.com/uim/uim"
license=(custom:BSD)
arch=(x86_64)
depends=(
  libedit
  libxft
  m17n-lib
)
makedepends=(
  anthy
  extra-cmake-modules
  gettext
  gtk2
  gtk3
  intltool
  plasma-framework5
  qt5-x11extras
  skk-jisyo
)
optdepends=(
  'anthy: input method'
  'gtk2: immodule and helper applications'
  'gtk3: immodule and helper applications'
  'qt5-declarative: immodule and helper applications'
  'qt5-x11extras: immodule and helper applications'
  'skk-jisyo: input method'
)

source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f442eed7fe58c69eaca1b92a9087e46474b71fd209e2c77c25b0643356067380')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/uim \
    --with-qt5-immodule \
    --with-qt5 \
    --with-anthy-utf8 \
    --with-skk

  make
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir" install -j1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
