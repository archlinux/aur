pkgname=aliyunpan-go
pkgver=0.3.3
pkgrel=1
pkgdesc="阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。 "
arch=('x86_64')
url="https://github.com/tickstep/aliyunpan"
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/tickstep/aliyunpan/archive/refs/tags/v$pkgver.tar.gz"
https://github.com/tickstep/aliyunpan/commit/7132342ed3ea6a5d4c9ffabdfe89849738525cdb.patch)
sha256sums=('390a298c7f429a7c47f82be9b666d8a4231b4d74724cb671de6cad25963cb6b9'
            '06b9bc6d9eb69963c1ecc76c0d83798cf06a94a43a3795eee70b047f71e0184c')

build() {
  cd "$srcdir/aliyunpan-$pkgver"
  patch -Np1 -i ../7132342ed3ea6a5d4c9ffabdfe89849738525cdb.patch
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .
}

package() {
  cd "$srcdir/aliyunpan-$pkgver"
  install -Dm755 aliyunpan "$pkgdir"/usr/bin/aliyunpan-go
  install -Dm644 docs/manual.md "$pkgdir"/usr/share/docs/aliyunpan-go/manual.md
}
