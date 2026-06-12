# Maintainer: ArDali <support@ardali.app>
# AUR package for Arch-based distros.
# Installs the prebuilt native Linux binary from DEB to avoid AppImage library conflicts

pkgname=ardali-bin
pkgver=4.1.8
pkgrel=3
pkgdesc="ArDali WebMedia multimedia ecosystem for Linux"
arch=('x86_64')
url="https://ardali.app"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'glib-networking'
  'gst-libav'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
)
provides=('ardali' 'ardali-webmedia')
conflicts=('ardali' 'aurivo-bin')
options=(!strip !debug)

_owner="Muhammed-Dali"
_repo="ArDali"
_tag="v${pkgver}"
_deb="ArDali.WebMedia_${pkgver}_amd64.deb"

source=(
  "https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_deb}"
)
sha256sums=('1d524c0c994b0d63272f1e883c26f8961eee0fbf3e6974d9af2a7fe973c6cbb8')

package() {
  # The outer .deb is automatically extracted by makepkg into $srcdir, yielding data.tar.gz
  tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # Provide a short alias 'ardali'
  ln -s /usr/bin/ardali-webmedia "${pkgdir}/usr/bin/ardali"
}
