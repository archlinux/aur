# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='stompbox-remote-bin'
pkgver='0.2.2'
pkgrel=1
pkgdesc='Guitar amplification and effects (remote UI)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/StompboxUI"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
_comp_name="${pkgname//-bin}"
conflicts=("$_comp_name")
provides=("$_comp_name")
options=(!strip)
source=('StompboxRemote.desktop')
source_x86_64=("StompboxRemoteLinux-x64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/StompboxRemoteLinux-x64.zip")
source_aarch64=("StompboxRemoteLinux-Arm64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/StompboxRemoteLinux-Arm64.zip")
b2sums=('c950eb879479400d3e53a97e80d926dcee4c91d2a2b70d882ee46ad5afd8053e81cae090c63eb0c54d46eda368e0494287076129b03b4853d6771d943bbe575d')
b2sums_x86_64=('81088bb381d0800b9537cfd84e75c23195c4c84413a81b2870b4d3cb17019836348328b4262bf4d65d44074b40d42dd1ddc6d88093b2702354d8f93b40d35522')
b2sums_aarch64=('5cdad9fb84c5ad12821a6af5b3444dbe217129b30cd923606f9dcf2dad9108c983aa0170aba71d61d9667c1d4225d4b85180ae46c3552098ea6f860fba6eed2f')

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
