# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
pkgname=leolock
pkgver=1.1.1
pkgrel=1
pkgdesc="LeoLock - 安全的文件加密解密工具"
arch=('x86_64')
url="https://github.com/lxp731/leolock"
license=('MIT')
depends=('glibc')
makedepends=('binutils' 'tar' 'zstd')
source=(leolock_${pkgver}_amd64.deb::https://github.com/lxp731/leolock/releases/download/v${pkgver}/leolock_${pkgver}_amd64.deb)
sha256sums=('d4c0b3b8604a0892c4a9d510f379d482b707715322691f900622982aea4fa51c')
prepare() {
  cd "$srcdir"
  # 解压 deb 包
  ar x leolock_${pkgver}_amd64.deb
  
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