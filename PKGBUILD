# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='stompbox-remote-bin'
pkgver='0.2.0'
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
b2sums=('c950eb879479400d3e53a97e80d926dcee4c91d2a2b70d882ee46ad5afd8053e81cae090c63eb0c54d46eda368e0494287076129b03b4853d6771d943bbe575d')
b2sums_x86_64=('90151d939d0127d11ad01424fcc3dc5bbb4ce835fde5ce8c06b67223a077e7765ea2239bc69f08299438be1dc1694197bf2260fe46bd2b332948d35bce43c53c')
b2sums_aarch64=('fe84c48086047f0550239aaa06c8a39d33f14151080a56be54d93036127d8f8e2e134f1ed0b2ae3a1119c58d47daabe3ebf75765f228856fde89bded42912a8b')

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
