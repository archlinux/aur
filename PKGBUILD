# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <phpwutz@gmail.com>
pkgname=k8sfw-webui-git
pkgrel=1
pkgdesc="UI for k8sfw-daemon"
pkgver=0.10.0.r2.gffd9f2b
arch=('x86_64')
url=""
license=('MIT')
groups=()
depends=('k8sfw-daemon-git' 'chromium')
makedepends=('git' 'cmake' 'nodejs-lts-gallium')
checkdepends=()
optdepends=()
provides=('k8sfw-webui')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("k8sfw-webui-git::git+ssh://git@gitlab.xn--kll-sna.net:10022/k8sfw/k8sfw-webui.git#branch=main")
noextract=()
validpgpkeys=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/k8sfw-webui-git && npm i && npm run build && npx @neutralinojs/neu build
}
package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/local/k8sfw-gui
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/192x192/apps
#     ls
    cp "${srcdir}/k8sfw-webui-git/neutralino.config.json" "${pkgdir}/usr/local/k8sfw-gui/neutralino.config.json"
    cp -r "${srcdir}/k8sfw-webui-git/build" "${pkgdir}/usr/local/k8sfw-gui/build"
    cp "${srcdir}/k8sfw-webui-git/dist/k8sfw-gui/k8sfw-gui-linux_x64" "${pkgdir}/usr/bin/k8sfw-gui"
    chmod +x "${pkgdir}/usr/bin/k8sfw-gui"
    cp "${srcdir}/k8sfw-webui-git/k8sfw.desktop" "${pkgdir}/usr/share/applications/k8sfw.desktop"
    cp "${srcdir}/k8sfw-webui-git/public/logo192.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/k8sfw.png"
    cp "${srcdir}/k8sfw-webui-git/dist/k8sfw-gui/resources.neu" "${pkgdir}/usr/local/k8sfw-gui/resources.neu"
}

install(){
     desktop-file-install --dir=~/.local/share/applications "${pkgdir}/usr/share/applications/k8sfw.desktop"
}
