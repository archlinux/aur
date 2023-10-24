pkgname=aliyunpan-go
pkgver=0.2.8
pkgrel=1
pkgdesc="阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。 "
arch=('x86_64')
url="https://github.com/tickstep/aliyunpan"
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/tickstep/aliyunpan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff1d61705a55277b1cd9cb28b5edb12a3f9ed91070fc1a69b3366b42316cd294')

build() {
  cd "$srcdir/aliyunpan-$pkgver"
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
