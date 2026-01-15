# Maintainer: wansing <mail at wansing dot org>
pkgname=traggo-bin
pkgver=0.8.2
pkgrel=2
pkgdesc="self-hosted tag-based time tracking"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/traggo/server"
license=('GPL')
depends=('glibc' 'sqlite')
backup=('etc/traggo/server.ini')
source=(
	"server.ini"
	"traggo.service"
	"traggo.sysusers"
	"traggo.tmpfiles"
)
source_x86_64=("${url}/releases/download/v${pkgver}/traggo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/traggo_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/traggo_${pkgver}_linux_armv7.tar.gz")

sha256sums=('b6eeb163ecee75c7a956c3819c82abc049f3671f78941ee1166d366fd84641b0'
            '7d6a2febfd733937a290d6c7047d6f92913cfd82c8669fb1eaaec312c9c83409'
            '149b7165c6b6a2d47a3b124bafcc216b34248326c356ff59c05112afed14c90b'
            'f878e3023b0647cf026c9a4f919130a6b6b32a8f5f3c3b4a33cfde0fb56acfee')
sha256sums_x86_64=('3e533d2ee0ec0f0afa76dd28626ac6d7f3828e74849962e450ab0c7052b81287')
sha256sums_aarch64=('070b1a01605524d4eefca1ce1f346720b52139b2064252a6eb5ad7fcbdfc4bda')
sha256sums_armv7h=('af80237a36bc9edcc9fb9a8be6d78f1997e54c1583c8d8a6c03ee49517da73d3')

package() {
  case "$CARCH" in
   "x86_64") _binary="amd64";;
   "aarch64") _binary="arm64";;
   "armv7h") _binary="arm-7";;
   *) echo "Unsupported architecture" && exit 1;;
  esac

  install -dm750                   "${pkgdir}/etc/traggo/"
  install -Dm640 "server.ini"      "${pkgdir}/etc/traggo/server.ini"
  install -Dm755 "traggo"          "${pkgdir}/usr/bin/traggo"
  install -Dm644 "traggo.service"  "${pkgdir}/usr/lib/systemd/system/traggo.service"
  install -Dm644 "traggo.sysusers" "${pkgdir}/usr/lib/sysusers.d/traggo.conf"
  install -Dm644 "traggo.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/traggo.conf"
}
