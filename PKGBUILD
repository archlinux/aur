# Maintainer: Fangru Shao <matrixc7p@gmail.com>
_pkgname=ant-browser
pkgname="${_pkgname}-bin"
pkgver=1.8.0
_tag="V1.8.0"
pkgrel=1
pkgdesc="Multi-profile anti-detect browser launcher with proxy management"
arch=('x86_64')
url="https://github.com/black-ant/Ant-Browser"
license=('custom')
depends=(
    'gdk-pixbuf2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source=("${pkgname}-${pkgver}.zip::https://github.com/black-ant/Ant-Browser/releases/download/${_tag}/ant-browser-linux-amd64.zip")
sha256sums=('79aa5a51e7fd30ea9f783e0f8d53ab49d3e630243056f8d14b8f40a24cf66d25')

prepare() {
    # Extract Debian package archive
    bsdtar -xf "ant-browser_${pkgver}_amd64.deb" data.tar.zst
}

package() {
    # Extract application tree
    bsdtar -xf data.tar.zst --no-same-owner -C "${pkgdir}/"

    # Fix executable permissions for binaries
    chmod 755 "${pkgdir}/opt/ant-browser/ant-chrome"
    chmod 755 "${pkgdir}/opt/ant-browser/bin/"*

    # Create symlinks in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/ant-browser/ant-chrome "${pkgdir}/usr/bin/ant-chrome"
    ln -sf /opt/ant-browser/ant-chrome "${pkgdir}/usr/bin/${_pkgname}"
}
