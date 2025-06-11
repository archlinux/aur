# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='stompbox-remote-bin'
pkgver='0.1.15'
pkgrel=1
pkgdesc='Guitar amplification and effects (remote UI)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/StompboxUI"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('glibc' 'gcc-libs' 'zlib')
_comp_name="${pkgname//-bin}"
conflicts=("$_comp_name")
provides=("$_comp_name")
options=(!strip)
source=('StompboxRemote.desktop')
source_x86_64=("StompboxRemoteLinux-x64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/StompboxRemoteLinux-x64.zip")
source_aarch64=("StompboxRemoteLinux-Arm64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/StompboxRemoteLinux-Arm64.zip")
sha256sums=('92df3628ce69f113421cb8e4cc9f4473da0b3de40f6841cb5937812126ebc7db')
sha256sums_x86_64=('5e31db98d40d40b2125270f132f4114b2aa50e3bdd28f87e2423abc77e368b7f')
sha256sums_aarch64=('edbab6a1b1ad21437f9ec93fb3cd11ff6e176caa05e16efa38b849e6d2ee20ce')

package() {
  cd "${srcdir}/StompboxRemote/"

  install -D -m 644 Content/Textures/* -t "${pkgdir}/opt/StompboxRemote/Content/Textures/"

  binary='StompboxRemoteGL'
  inst_dir='/opt/StompboxRemote'
  install -D -m 755 "$binary" -t "${pkgdir}/${inst_dir}"
  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s "${inst_dir}/${binary}" "${pkgdir}/usr/bin/"

  cd "${srcdir}/"
  install -D -m 644 StompboxRemote.desktop -t "${pkgdir}/usr/share/applications/"
}
