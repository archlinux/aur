# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
pkgname=leolock
pkgver=1.0.3
pkgrel=2
pkgdesc="LeoLock - 安全的文件加密解密工具"
arch=('x86_64')
url="https://github.com/lxp731/leolock"
license=('MIT')
depends=('glibc')
makedepends=('binutils' 'tar' 'zstd')
source=(leolock_${pkgver}-${pkgrel}_amd64.deb::https://github.com/lxp731/leolock/releases/download/v${pkgver}-${pkgrel}/leolock_${pkgver}-${pkgrel}_amd64.deb)
sha256sums=('961d0124c4831944d6107ec1d3bf92b8afc89e7a798097ee0e40bb66d8fd49f0')
# https://github.com/lxp731/leolock/releases/download/v1.0.3-2/leolock_1.0.3-2_amd64.deb
prepare() {
  cd "$srcdir"
  # 解压 deb 包
  ar x leolock_${pkgver}-${pkgrel}_amd64.deb
  
  # 查看 deb 包中包含哪些文件
  local data_tar=$(ls data.tar.* | head -n1)
  tar -xf $data_tar
}

build() {
  true
}

check() {
  true
}

package() {
  cd "$srcdir"

  # 复制二进制文件到目标目录
  install -Dm755 usr/bin/leolock "$pkgdir/usr/bin/leolock"
  
  # 移除可能存在的调试符号文件
  find "$pkgdir" -name "*-debug" -type f -delete 2>/dev/null || true
  find "$pkgdir" -name "*.debug" -type f -delete 2>/dev/null || true
}