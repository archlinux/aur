# Maintainer: moecly <moecly@users.noreply.github.com>
pkgname=omp-ctl-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Desktop GUI for managing omp configuration in ~/.omp-ctl (prebuilt)'
arch=('x86_64')
url='https://github.com/moecly/omp-ctl'
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'glibc' 'gcc-libs')
provides=('omp-ctl')
conflicts=('omp-ctl')
source=("$url/releases/download/v$pkgver/omp-ctl_${pkgver}_amd64.deb")
sha256sums=('a1fb0b6f916d8a91dedd2641cf692ce0619bae23aefac01c2a9240f0b6cfa9a6')
noextract=("omp-ctl_${pkgver}_amd64.deb")
options=('!strip' '!debug')

package() {
    # 原样展开 CI 产出的 .deb（与 release 资产逐字节一致，不再二次编译），
    # 它已含 /usr/bin/omp-ctl、desktop 文件与 hicolor 图标。
    # 两步都用 bsdtar：libarchive 能自动识别 data.tar.gz/zst 的压缩，GNU tar 从管道读时不会。
    bsdtar -xOf "omp-ctl_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - --no-same-owner -C "$pkgdir"
}
