# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>   

pkgname=v2ray-plugin
pkgver=1.0
pkgrel=1
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
makedepends=('go')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=($pkgname::"git+https://github.com/shadowsocks/$pkgname.git#tag=v$pkgver"
        "https://raw.githubusercontent.com/shadowsocks/$pkgname/master/LICENSE")
sha256sums=('SKIP'
            'd903af2e15f43ddc5782ec20a0f1bdd090974ebea01ab02e0b015b76283ea666')

build() {
  export GOPATH="$srcdir"/gopath
  cd $srcdir/$pkgname
  go get -u -v github.com/shadowsocks/$pkgname
  go build -v \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}
package() {
  cd $srcdir/$pkgname
  install -Dm755 $pkgname  ${pkgdir}/usr/bin/$pkgname
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/$pkgname/
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
