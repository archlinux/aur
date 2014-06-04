# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
pkgver=1.0.2~ati_hotfix1
_pkgver=1.0.2-ATI-hotfix1
pkgrel=2
pkgdesc="Doom 3 BFG source code (Robert Beckebans repo)."
arch=('i686' 'x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
groups=('games')
depends=('libgl' 'alsa-lib' 'openal' 'libxxf86vm'
         'libstdc++5' 'sdl' 'doom3bfg-data' 'ffmpeg')
makedepends=('cmake' 'zip')
conflicts=('rbdoom3-bfg-git')
optdepends=('alsa-plugins: pulseaudio-support'
            'libpulse: pulseaudio support')
source=("https://github.com/RobertBeckebans/RBDOOM-3-BFG/archive/v${_pkgver}.tar.gz"
        'path.patch'
        'rbdoom-3-bfg.desktop')
sha256sums=('a276d1bfd6cc55f3bb62c15992973ceafaed49cbca7bb1257e51970efe4ba988'
            '8e0aa8ade8d58f3b3e5b6917d6d1d501d20752a7966842c468cedd53b14ebfed'
            'b138577e7716e770e189acc58ac145d7426bd2c0719236630e93743ff1345bb3')

build() {
  cd RBDOOM-3-BFG-${_pkgver}/neo
  patch -Np1 -i ../../path.patch
  sh cmake-eclipse-linux-profile.sh
  cd ../build
  make
}

package() {
  cd "$srcdir"/RBDOOM-3-BFG-${_pkgver}
  install -m 755 -d "$pkgdir"/usr/bin/
  install -m 755 build/RBDoom3BFG "$pkgdir"/usr/bin/RBDoom3BFG
  install -D -m 644 "$srcdir"/rbdoom-3-bfg.desktop "$pkgdir"/usr/share/applications/rbdoom-3-bfg.desktop
}
