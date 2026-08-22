pkgname=sealantern-connect
pkgver=1.0.1
pkgrel=1
pkgdesc='Lightweight Minecraft Java Edition P2P multiplayer client powered by sculk'
arch=('x86_64' 'aarch64')
url='https://github.com/SeaLantern-Studio/SeaLantern-Connect'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
options=('!strip')
source_x86_64=('sealantern-connect-1.0.1-x86_64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v1.0.1/SeaLantern.Connect_1.0.1_amd64.deb')
source_aarch64=('sealantern-connect-1.0.1-aarch64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v1.0.1/SeaLantern.Connect_1.0.1_arm64.deb')
sha256sums_x86_64=('1979865ef815f06309eda7ed55567a04c1d508221d5c7cc2b280f1dfd9c6046b')
sha256sums_aarch64=('c6ac9dd2c3ace6a0245daf5ecf87fa17620fcbc44ae59eba02650ddb22543b1f')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='sealantern-connect-1.0.1-x86_64.deb' ;;
    aarch64) deb='sealantern-connect-1.0.1-aarch64.deb' ;;
    *) return 1 ;;
  esac

  local unpack_dir="${srcdir}/deb-data"
  rm -rf "${unpack_dir}"
  mkdir -p "${unpack_dir}"
  bsdtar -xf "${srcdir}/${deb}" -C "${unpack_dir}"

  local data_tar
  data_tar="$(find "${unpack_dir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  if [[ -z "${data_tar}" ]]; then
    echo "failed to locate data.tar.* in ${deb}" >&2
    return 1
  fi
  bsdtar -xf "${data_tar}" -C "${pkgdir}"
}
