pkgname=folia-major-bin
pkgver=0.7.9
pkgrel=1
pkgdesc="Lyrics Reimagine desktop app packaged from prebuilt releases"
arch=('x86_64')
url="https://github.com/chthollyphile/folia-major"
license=('AGPL')
depends=(
  'alsa-lib'
  'gtk3'
  'libxss'
  'nss'
)
optdepends=(
  'xdg-utils: desktop integration helpers'
)
provides=('folia-major')
conflicts=('folia-major')
source=(
  "https://github.com/chthollyphile/folia-major/releases/download/v${pkgver}/folia-major-${pkgver}-linux-x64.tar.gz"
  'folia-major.desktop'
  'folia-major.png'
)
sha256sums=(
  'SKIP'
  'd4e077790a260ae00ff9ec6f859f6add8f404e45674968e9ae085be17b2e0d43'
  'cffe4a4fe5608706e2522de3b4cd8cc174357a9310493f107553794831312054'
)

package() {
  local appdir

  appdir="$(dirname "$(find "${srcdir}" -type f -name 'folia-major' -perm -u+x | head -n1)")"
  if [[ -z "${appdir}" ]]; then
    echo "Could not locate packaged folia-major executable in extracted archive" >&2
    return 1
  fi

  install -dm755 "${pkgdir}/opt/folia-major"
  cp -a "${appdir}/." "${pkgdir}/opt/folia-major/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/folia-major/folia-major" "${pkgdir}/usr/bin/folia-major"

  install -Dm644 "${srcdir}/folia-major.desktop" \
    "${pkgdir}/usr/share/applications/folia-major.desktop"
  install -Dm644 "${srcdir}/folia-major.png" "${pkgdir}/usr/share/pixmaps/folia-major.png"
}
