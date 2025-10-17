# Maintainer: yuztra <panduodenk98@gmail.com>
# Contributor: Evan Goode <mail@evangoo.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=fjordlauncher-bin
pkgver=9.4.2
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('x86_64')
url="https://github.com/unmojang/FjordLauncher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
depends=(
  'glibc'
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
provides=('fjordlauncher')
conflicts=('fjordlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/unmojang/FjordLauncher/releases/download/${pkgver}/FjordLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz")
noextract=("FjordLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz")
sha256sums=('7cc0e27b5c5033da9ee997efd47db1f7358153ae6cc64c1353a497fe0f6a7fb3')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf FjordLauncher-Linux-Qt6-Portable-${pkgver}.tar.gz
    # Remove portable support files
    rm "${pkgdir}"/usr/manifest.txt "${pkgdir}"/usr/portable.txt "${pkgdir}"/usr/qt.conf "${pkgdir}"/usr/qtlogging.ini "${pkgdir}"/usr/FjordLauncher "${pkgdir}"/usr/bin/fjordlauncher_updater
    rm -rf "${pkgdir}"/usr/lib "${pkgdir}"/usr/plugins
    mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
       "${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
