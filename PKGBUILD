# Maintainer: LitGit Team

pkgname=litgit-desktop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, fluent, and minimal Git client designed for developers who demand speed and a clutter-free workflow"
arch=("x86_64")
url="https://github.com/yourtoools/LitGit"
license=("custom:proprietary")
depends=(
  "cairo"
  "desktop-file-utils"
  "gdk-pixbuf2"
  "glib2"
  "gtk3"
  "hicolor-icon-theme"
  "libsoup"
  "pango"
  "webkit2gtk-4.1"
)
provides=("litgit-desktop")
conflicts=("litgit-desktop")
options=("!strip" "!emptydirs")
install="${pkgname}.install"
source_x86_64=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/LitGit.Desktop_${pkgver}_amd64.deb"
)
sha256sums_x86_64=('a99a3c1270b64ac1b36fc170d4f053f9b4dedbc04e61c2eab83098096fb9ed48')

package() {
  local deb_archive="${srcdir}/${pkgname}-${pkgver}.deb"
  local data_archive=""

  cd "${srcdir}" || return 1
  bsdtar -xf "${deb_archive}"

  for archive in "${srcdir}"/data.tar.*; do
    if [[ -f "${archive}" ]]; then
      data_archive="${archive}"
      break
    fi
  done

  if [[ -z "${data_archive}" ]]; then
    echo "Unable to locate data archive inside ${deb_archive}" >&2
    return 1
  fi

  bsdtar -xf "${data_archive}" -C "${pkgdir}"
}
