# Maintainer: moecly <moecly@users.noreply.github.com>
pkgname=omp-ctl-bin
pkgver=0.8.5
pkgrel=1
pkgdesc='Desktop GUI for managing omp configuration in ~/.omp-ctl (prebuilt)'
arch=('x86_64')
url='https://github.com/moecly/omp-ctl'
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'glibc' 'gcc-libs')
provides=('omp-ctl')
conflicts=('omp-ctl')
source=("$url/releases/download/v$pkgver/omp-ctl_${pkgver}_amd64.deb")
sha256sums=('fd2c1bbbd2edf6a98b6d0b9be356925b3d57a600e33565064c2f5e41f80cb069')
noextract=("omp-ctl_${pkgver}_amd64.deb")
options=('!strip' '!debug')

package() {
    # 原样展开 CI 产出的 .deb（与 release 资产逐字节一致，不再二次编译），
    # 它已含 /usr/bin/omp-ctl、desktop 文件与 hicolor 图标。
    # 两步都用 bsdtar：libarchive 能自动识别 data.tar.gz/zst 的压缩，GNU tar 从管道读时不会。
    bsdtar -xOf "omp-ctl_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - --no-same-owner -C "$pkgdir"
}
