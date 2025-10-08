# Maintainer: WaiJade <waijade@outlook.com>
# Contributor: OrPudding <t3164473115@163.com>
pkgname=astro-box
pkgver=1.5.2.1
pkgrel=1
pkgdesc="A multifunctional toolbox designed for Xiaomi Vela wearable devices"
arch=('x86_64')
url="https://github.com/CheongSzesuen/AstroBox-archLinux"
license=('custom')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1' 'xz')
makedepends=('binutils')
options=('!debug')
provides=('astrobox')

# 从GitHub Releases下载deb包
source=("https://github.com/CheongSzesuen/AstroBox-archLinux/releases/download/v${pkgver}/AstroBox_${pkgver}_amd64.deb")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    # 解包deb文件
    ar x "AstroBox_${pkgver}_amd64.deb"
    tar -xf data.tar.* --exclude='./DEBIAN'
}

package() {
    cd "${srcdir}"
    
    # 复制所有文件到包目录
    cp -r usr "${pkgdir}"/
    
    # 设置正确的权限
    chmod 755 "${pkgdir}/usr/bin/Astro-Box"
    
    # 设置图标权限
    find "${pkgdir}/usr/share/icons" -type f -name "*.png" -exec chmod 644 {} \;
    
    # 设置桌面文件权限
    chmod 644 "${pkgdir}/usr/share/applications/AstroBox.desktop"
}

# vim: ts=2 sw=2 et:
