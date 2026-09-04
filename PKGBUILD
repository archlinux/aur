pkgname=luotopia-bin
pkgver=1.0.0+7
pkgrel=1
pkgdesc='Luotopia campus client for Wuhan University'
arch=('x86_64' 'aarch64')
url='https://github.com/ClosedWHU/Luotopia'
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsecret'
  'util-linux-libs'
  'xz'
)
provides=('luotopia')
conflicts=('luotopia')
options=('!strip')

source=('luotopia.desktop')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ClosedWHU/Luotopia/releases/download/v1.0.0+7/luotopia-1.0.0-7-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ClosedWHU/Luotopia/releases/download/v1.0.0+7/luotopia-1.0.0-7-linux-arm64.tar.gz")
sha256sums=('0c1a01832e156bfccf051eef400a7fd2b7ab5a7f300d56eed784c7b0f090254e')
sha256sums_x86_64=('98881a70e85f21cc4ba1f05b1accf24935bdbcc3a2d9d6183e2a1006baffe79e')
sha256sums_aarch64=('fd948781b0d33dece55ac78aa0fe801f6d0b9f831b7c310a9bbe61003b0e9688')

package() {
  local bundle_dir
  if [[ -d "${srcdir}/luotopia" ]]; then
    bundle_dir="${srcdir}/luotopia"
  elif [[ -d "${srcdir}/bundle" ]]; then
    bundle_dir="${srcdir}/bundle"
  else
    printf '%s\n' 'Linux release bundle not found' >&2
    return 1
  fi

  install -dm755 "${pkgdir}/opt/luotopia"
  cp -r "${bundle_dir}/." "${pkgdir}/opt/luotopia/"
  chmod 755 "${pkgdir}/opt/luotopia/luotopia"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/luotopia/luotopia "${pkgdir}/usr/bin/luotopia"
  install -Dm644 "${srcdir}/luotopia.desktop" \
    "${pkgdir}/usr/share/applications/luotopia.desktop"
  install -Dm644 \
    "${bundle_dir}/data/flutter_assets/assets/icon/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/luotopia.png"
}
