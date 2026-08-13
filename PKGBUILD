pkgname=sealantern-connect
pkgver=0.8.3
pkgrel=1
pkgdesc='Lightweight Minecraft Java Edition P2P multiplayer client powered by sculk'
arch=('x86_64' 'aarch64')
url='https://github.com/SeaLantern-Studio/SeaLantern-Connect'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
options=('!strip')
source_x86_64=('sealantern-connect-0.8.3-x86_64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.8.3/SeaLantern.Connect_0.8.3_amd64.deb')
source_aarch64=('sealantern-connect-0.8.3-aarch64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.8.3/SeaLantern.Connect_0.8.3_arm64.deb')
sha256sums_x86_64=('cbda42ca0b265169ce7ebe61437c29b1ecd0a1f18d9fb2e95c04c30194ef2512')
sha256sums_aarch64=('b5734c9e54abaf35bab97671ea5976400838761e34c66810abb49531b410823e')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='sealantern-connect-0.8.3-x86_64.deb' ;;
    aarch64) deb='sealantern-connect-0.8.3-aarch64.deb' ;;
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
