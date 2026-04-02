# Maintainer: dzyanino <dzyanino@gmail.com>

pkgname=special-eureka-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A desktop mangareader built in Tauri and Svelte"

arch=(x86_64)
url="https://github.com/tonymushah/special-eureka"
license=('GPL-3.0')

provides=("${pkgname}=$pkgver")
conflicts=("${pkgname}")

depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)

options=('!strip' '!debug')

install=${pkgname}.install

noextract=(
  "${pkgname}_${pkgver}_amd64.deb"
)

source_x86_64=("${url}/releases/download/v${pkgver}/Special.Eureka_${pkgver}_amd64.deb")
sha256sums_x86_64=('2df2b201d20cfe8a733922f4d623acb04974e41dc8e1fdea1bc214ecc435c0ac')


package() {
  cd "${srcdir}"

  local debfile
  debfile=$(find . -maxdepth 1 -name '*.deb' | head -n1)

  ar x "${debfile}"

  tar -xf data.tar.* -C "${pkgdir}"

  find "${pkgdir}" -type d -exec chmod 755 {} \;
}