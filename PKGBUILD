# Maintainer: wansing <mail at wansing dot org>
pkgname=traggo-bin
pkgver=0.8.3
pkgrel=1
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
sha256sums_x86_64=('c14012c5d4975c23e8214770bba02a106de7fa8fcf1d10c7a127ebec30536639')
sha256sums_aarch64=('cc44e61a99b7741cc8c4820f695ce52d1af437e82948e8ab2832b56388990f70')
sha256sums_armv7h=('454e2235c268cc4d31de1a27a8430db41d5f1998375b8539353393e0f26e3fa0')

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
