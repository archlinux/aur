# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='stompbox-remote-bin'
pkgver='0.1.14'
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
source_x86_64=("${url}/releases/download/v${pkgver}/StompboxRemoteLinux-x64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/StompboxRemoteLinux-Arm64.zip")
sha256sums=('92df3628ce69f113421cb8e4cc9f4473da0b3de40f6841cb5937812126ebc7db')
sha256sums_x86_64=('1ff5b18e601ebec64898b8553e128e4045986d3ba591c9cd6267ee1ebf2b71e7')
sha256sums_aarch64=('fd4a93655e2af9593a7e956798d3e4e6189d610c4edd685f2f708dfd430494b6')

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
