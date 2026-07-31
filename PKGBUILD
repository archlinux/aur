pkgname=sealantern-connect
pkgver=0.2.1
pkgrel=1
pkgdesc='Lightweight Minecraft Java Edition P2P multiplayer client powered by sculk'
arch=('x86_64' 'aarch64')
url='https://github.com/SeaLantern-Studio/SeaLantern-Connect'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
options=('!strip')
source_x86_64=('sealantern-connect-0.2.1-x86_64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.2.1/SeaLantern.Connect_0.2.1_amd64.deb')
source_aarch64=('sealantern-connect-0.2.1-aarch64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.2.1/SeaLantern.Connect_0.2.1_arm64.deb')
sha256sums_x86_64=('54ed9433ab3f877d1ab94d47319ec8ffb300f3ba17f3a8da92c814d5946e05e5')
sha256sums_aarch64=('2d255be47628707b9b78a7c2eef88ad1c4919693b47088b7271007c5c13665f1')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='sealantern-connect-0.2.1-x86_64.deb' ;;
    aarch64) deb='sealantern-connect-0.2.1-aarch64.deb' ;;
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
