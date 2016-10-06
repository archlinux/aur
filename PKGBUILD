# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Andreas Linz <alinz@klingt.net>
# Based on `caddy=all-features` by Eric Engestrom: https://aur.archlinux.org/packages/caddy-all-features/
# Enable Cross Origin Resource Sharing

pkgname=caddy-full-bin
_realname=caddy
pkgver=0.9.3
pkgrel=9
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform (All features enabled)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://caddyserver.com"
license=('Apache')
provides=('caddy')
conflicts=('caddy' 'caddy-git' 'caddy-all-features')
depends=('systemd>=229')
makedepends=('patch')
md5sums_i686=('f9d2b5d0b8bfe5226bfc367fadadae8e'
              '77e89ee90f6b69730b11ca83c7fbf48b')
md5sums_x86_64=('8bfb5dc8f98746c163996e350a7c3732'
                '77e89ee90f6b69730b11ca83c7fbf48b')
md5sums_armv7h=('aef7bb0d32988c2eb018937132bfe7c9'
                '77e89ee90f6b69730b11ca83c7fbf48b')
md5sums_aarch64=('aef7bb0d32988c2eb018937132bfe7c9'
                 '77e89ee90f6b69730b11ca83c7fbf48b')
install='caddy-full-bin.install'

source_i686=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}/caddy-all-plugins-${pkgver}-386.tar.gz" "caddy-systemd-service.patch")
source_x86_64=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}/caddy-all-plugins-${pkgver}-amd64.tar.gz" "caddy-systemd-service.patch")
source_armv7h=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}/caddy-all-plugins-${pkgver}-arm.tar.gz" "caddy-systemd-service.patch")
source_aarch64=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}/caddy-all-plugins-${pkgver}-arm.tar.gz" "caddy-systemd-service.patch")

prepare() {
  msg2 "Patching systemd service file"
  patch -Np1 -i "${srcdir}/caddy-systemd-service.patch" "${srcdir}/init/linux-systemd/caddy.service"
}

package() {
  install -Dm755 "${srcdir}/caddy" "${pkgdir}/usr/bin/caddy"
  install -Dm644 "${srcdir}/init/linux-systemd/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
  install -Dm644 "${srcdir}/init/linux-systemd/README.md" "${pkgdir}/usr/share/doc/${_realname}/service.txt"
  install -Dm644 "${srcdir}/LICENSES.txt" "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/usr/share/doc/${_realgname}/README.md"
}
