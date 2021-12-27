# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
# Contributor: odrling <florianbadie@odrling.xyz>
pkgname=aegisub-japan7-git
pkgver=3.3.3.r290.1b821bbd4
pkgrel=1
pkgdesc='A fork of aegisub including tap-to-time feature and custom user scripts'
arch=(x86_64)
url=https://github.com/odrling/Aegisub
license=(
  custom
)
depends=(
  alsa-lib
  amaranth-font
  boost-libs
  fftw
  fontconfig
  hunspell
  icu
  libass.so
  libffms2.so
  libgl
  libpulse
  luajit-2.1-lua52-git
  openssl
  uchardet
  wxgtk3
  zlib
)
makedepends=(
  autoconf-archive
  boost
  git
  intltool
  mesa
  meson
)
provides=(aegisub)
conflicts=(aegisub)
source=(
  aegisub::git+https://github.com/odrling/Aegisub.git
)
sha256sums=(
  SKIP
)

pkgver() {
  cd aegisub

  tag='v3.3.3'

  echo "${tag#v}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd aegisub

  arch-meson builddir -Dportaudio=disabled -Dopenal=disabled -Dtests=false
}

build() {
  cd aegisub

  ninja -C builddir
}

package() {
  cd aegisub

  DESTDIR="${pkgdir}" ninja -C builddir install
  install -Dm 644 LICENCE -t "${pkgdir}"/usr/share/licenses/aegisub-git/
}

# vim: ts=2 sw=2 et:

