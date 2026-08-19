pkgname=shrieker-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='GUI client for the sculk P2P tunnel library (prebuilt binary)'
arch=('x86_64')
url='https://github.com/KercyDing/shrieker'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'wayland' 'libx11' 'libglvnd' 'glib2' 'gtk3' 'libayatana-appindicator')
provides=('shrieker')
conflicts=('shrieker')
source=(
  'https://github.com/KercyDing/shrieker/releases/download/v0.6.2/shrieker-0.6.2-linux-amd64.deb'
  'shrieker-0.6.2.desktop::https://raw.githubusercontent.com/KercyDing/shrieker/v0.6.2/shrieker.desktop'
  'shrieker-0.6.2.png::https://raw.githubusercontent.com/KercyDing/shrieker/v0.6.2/assets/icon.png'
)
sha256sums=(
  '7bf9905109dd3d030ed50bf261d905c257ccf033911ea023e388b4824be98368'
  'b23ed24be29740d0138d94045415f73ab563eb3b94bd7f7937aaae1a33f6c977'
  'df06d92c1ed31506aebfb9af388e22ac5bd0b4b95152d499c7905065d1d5aebc'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "shrieker-0.6.2-linux-amd64.deb"
  local data_tar
  data_tar="$(find . -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "${data_tar}" ]]; then
    echo "failed to locate data.tar.* in shrieker-0.6.2-linux-amd64.deb" >&2
    exit 1
  fi
  bsdtar -xf "${data_tar}" "./usr/bin/shrieker"
  install -Dm755 "${srcdir}/usr/bin/shrieker" "${pkgdir}/usr/bin/shrieker"
  install -Dm644 "${srcdir}/shrieker-0.6.2.desktop" "${pkgdir}/usr/share/applications/shrieker.desktop"
  install -Dm644 "${srcdir}/shrieker-0.6.2.png" "${pkgdir}/usr/share/pixmaps/shrieker.png"
}
