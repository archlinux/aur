# Maintainer: Nk-YMZ <village_flute@outlook.com>

pkgname=splayer-forge
pkgver=3.1.1
pkgrel=5
epoch=1
pkgdesc="SPlayer Forge - 修复播放队列的 SPlayer 社区构建"
arch=('x86_64')
url="https://github.com/Nk-YMZ/SPlayer-Forge"
license=('AGPL-3.0-only')
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'libevent'
  'libnotify'
  'libvips'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
)
optdepends=(
  'libappindicator: 系统托盘图标支持'
  'mpv: MPV 播放引擎支持'
)
provides=("splayer=${pkgver}")
conflicts=('splayer')
options=('!strip' '!debug')
install=splayer-forge.install
source=("splayer-${pkgver}-${pkgrel}-x64.pkg.tar.zst::https://github.com/Nk-YMZ/SPlayer-Forge/releases/download/arch-v${pkgver}-${pkgrel}/splayer-${pkgver}-x64.pkg.tar.zst")
noextract=("splayer-${pkgver}-${pkgrel}-x64.pkg.tar.zst")
sha256sums=('00177ca3220c71c5646aea708ff7fca1bdb5b60f41932bb1669543c3f4afedba')

package() {
  bsdtar -xf "${srcdir}/splayer-${pkgver}-${pkgrel}-x64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.INSTALL' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO'

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/SPlayer/SPlayer' "${pkgdir}/usr/bin/SPlayer"
}
