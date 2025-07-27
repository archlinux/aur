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

pkgname=shatteredprism-bin
pkgver=1.7
pkgrel=1
pkgdesc="DRM-free Prism Launcher fork with support for alternative auth servers (precompiled)"
arch=('x86_64')
url="https://github.com/LunaisLazier/ShatteredPrism"
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
provides=('shatteredprism')
conflicts=('shatteredprism')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older Minecraft versions'
            'flite: Minecraft voice narration'
)
source=("https://github.com/LunaisLazier/ShatteredPrism/releases/download/${pkgver}/ShatteredPrism-Linux-Qt6-Portable-${pkgver}.tar.gz")
noextract=("ShatteredPrism-Linux-Qt6-Portable-${pkgver}.tar.gz")
sha256sums=('b7490e0147ffb519f9d7026e9ef76a382bfc07be0b6c2fd046f72538f207b1eb')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf ShatteredPrism-Linux-Qt6-Portable-${pkgver}.tar.gz
    # Remove portable support files
    rm "${pkgdir}"/usr/manifest.txt "${pkgdir}"/usr/portable.txt "${pkgdir}"/usr/qt.conf "${pkgdir}"/usr/qtlogging.ini "${pkgdir}"/usr/ShatteredPrism "${pkgdir}"/usr/bin/shatteredprism_updater
    rm -rf "${pkgdir}"/usr/lib "${pkgdir}"/usr/plugins
    mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
       "${pkgdir}/usr/share/mime/packages/shatteredprism-modrinth-mrpack-mime.xml"
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
