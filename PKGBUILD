# Maintainer: yuztra <panduodenk98@gmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>

pkgname=prismlauncher-bin
pkgver=9.4
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
depends=(
  'gcc-libs'
  'java-runtime>=17'
  'libgl'
  'qt6-base'
  'qt6-5compat'
  'qt6-svg'
  'qt6-imageformats'
  'qt6-networkauth'
  'zlib'
  'hicolor-icon-theme'
)
provides=('prismlauncher')
conflicts=('prismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz")
sha256sums=('269056b281a36c872c7d904b3483c046a9766cf1a65618338e2edcd48695bc1d')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PrismLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz
    # Remove portable support files
    rm "${pkgdir}"/usr/manifest.txt "${pkgdir}"/usr/portable.txt "${pkgdir}"/usr/qt.conf "${pkgdir}"/usr/qtlogging.ini "${pkgdir}"/usr/PrismLauncher "${pkgdir}"/usr/bin/prismlauncher_updater
    rm -rf "${pkgdir}"/usr/lib "${pkgdir}"/usr/plugins
    mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
       "${pkgdir}/usr/share/mime/packages/prismlauncher-modrinth-mrpack-mime.xml"
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
