# Maintainer: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='An open-source, cross-platform terminal for seamless workflows (binary)'
arch=('x86_64')
url="https://www.waveterm.dev"
license=('Apache')
depends=()
makedepends=('unzip' 'gendesk')
source=("https://github.com/wavetermdev/waveterm/releases/download/v0.5.0/waveterm-linux-x64-v0.5.0.zip")
sha256sums=('ddb454bbcc18175eb01784fce9246aa48870c3099460627609b4cf8b47aad0ae')

package() {
  
  # bin
  mkdir -p ${pkgdir}/opt/waveterm
  cp -r ${srcdir}/Wave-linux-x64/* ${pkgdir}/opt/waveterm/
  chmod +x ${pkgdir}/opt/waveterm/Wave
  mv ${pkgdir}/opt/waveterm/Wave ${pkgdir}/opt/waveterm/waveterm
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/waveterm/waveterm ${pkgdir}/usr/bin/waveterm

  # license
  mkdir -p ${pkgdir}/usr/share/licenses/waveterm
  cp -r ${srcdir}/Wave-linux-x64/LICENSE ${pkgdir}/usr/share/licenses/waveterm/LICENSE

  # desktop icon and entry
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  cp -r ${srcdir}/Wave-linux-x64/resources/app/dist/870c6c70c952160273688bf919cfb761.svg ${pkgdir}/usr/share/pixmaps/waveterm.svg
  gendesk
  mkdir -p ${pkgdir}/usr/share/applications/
  cp -r waveterm.desktop ${pkgdir}/usr/share/applications/waveterm.desktop 
}
