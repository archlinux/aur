pkgname=d2-mf-tracker
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight cross-platform desktop app for manually tracking Diablo 2 magic find sessions."
arch=('x86_64')
url="https://github.com/wilkinson4/d2_mf_run_tracker"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=d2-mf-tracker.install
_deb="d2-mf-tracker_0.1.0_amd64.deb"
source=("d2-mf-tracker.install")
source_x86_64=("https://github.com/wilkinson4/d2_mf_run_tracker/releases/download/app-v0.1.0/${_deb}")
sha256sums=('SKIP')
sha256sums_x86_64=('73725ecaa0329e7da280c77da25ec6fdc300f1eab6491b3bc93ae73eed0c732e')

package() {
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}"

  local data_archive
  data_archive="$(find "${srcdir}" -maxdepth 1 -name 'data.tar.*' -print -quit)"

  if [[ -z "${data_archive}" ]]; then
    echo "Unable to locate deb payload archive." >&2
    exit 1
  fi

  bsdtar -xf "${data_archive}" -C "${pkgdir}"
}
