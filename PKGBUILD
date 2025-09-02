

pkgname=cef-bin
pkgver=139.0.38+g7656fe3
_chromium=139.0.7258.139
pkgrel=1
pkgdesc="A simple framework for embedding Chromium in apps"
arch=("x86_64")
url=https://github.com/chromiumembedded/cef
_tarball=cef_binary_${pkgver}+chromium-${_chromium}_linux64_client.tar.bz2
source=(https://cef-builds.spotifycdn.com/${_tarball})
license=(BSD-3-Clause)
depends=(at-spi2-core expat mesa pango gcc-libs libxext glibc libcups nss libxcb glib2 nspr libxfixes libxrandr libxdamage alsa-lib cairo libx11 systemd-libs libxcomposite  libxkbcommon dbus)
DLAGENTS="https::/bin/true"
sha256sums=(SKIP)
_sha256sum=1089e63e096b42049dc33b41491d216d1ce8d0f6fcf3fddd9d3f5da44abb52d6
package() {
  install -d "$pkgdir"/usr/{lib/cef,bin}
  cd "$pkgdir"/usr/lib/cef
  curl -q ${source[0]} | tar --strip-components=2 -xjf - ${_tarball%.tar.bz2}/Release
  chown -R root:root .
  sha256sum libcef.so
  echo -e "should be\n${_sha256sum}"
  ln -sf /usr/lib/cef/cefsample "$pkgdir"/usr/bin/cefsample
}
