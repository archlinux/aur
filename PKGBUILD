# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Mihók Martin <mihok.martin@protonmail.com>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: Niklas Wojtkowiak <aur.7xcqe@passmail.com>
_pkgname='spacedrive'
pkgname="${_pkgname}-bin"
pkgver='0.4.3'
pkgrel='1'
epoch='1'
pkgdesc="A file manager from the future."
arch=('x86_64')
url="https://spacedrive.com"
_url_source='https://github.com/spacedriveapp/spacedrive'
license=('AGPL3')
source=("Spacedrive-linux-$pkgver-x86_64.deb::${_url_source}/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb")
sha256sums=('30b0801cd2c9ffd6dd0812c106cb2ba64f7cbaf2937c7b3d606c66c49d75fe86')
depends=(gtk3 ffmpeg glibc gcc-libs glib2 pango libsoup cairo gdk-pixbuf2 libheif onnxruntime webkit2gtk-4.1 xdotool)
provides=(spacedrive)
conflicts=(spacedrive)

package() {
  tar -xf "${srcdir}/data.tar.gz" --directory "${srcdir}"
  #temporary workaround fixes #2006
  mkdir -p "${pkgdir}/usr/lib/spacedrive/"
  ln -s "/usr/lib/libonnxruntime.so" "${pkgdir}/usr/lib/spacedrive/libonnxruntime.so"

  chmod -R 755 "${srcdir}/usr/share/"
  install -Dm755 "${srcdir}/usr/bin/spacedrive" "${pkgdir}/usr/bin/spacedrive"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
}

