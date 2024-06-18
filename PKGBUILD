# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=ipinfo-cli
pkgname="${_pkgname}-bin"
pkgver=3.3.1
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("LICENSE")
sha256sums=('4d10fe5f3aa176b05b229a248866bad70b834c173f1252a814ff4748d8a13837')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("81e62958fcb91f979c03d0f10887486df1460d432d0d4c2e86a3079f6039840a")
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm.tar.gz")
sha256sums_armv7h=("12746e0672aa88f4e6a3e5e92de49dcfcf0c6433d8727496d1a3e9587b06a420")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=("b1e00471f50cdae33cf7423f21970fa6f1e05bc13167babe43c6869988dd943d")



build() {
  #ls -la
  find . -type f -name 'ipinfo_'${pkgver}'_*' -exec mv {} ipinfo \;
  strip ipinfo
}

package() {
  install -Dm755 -d "${pkgdir}/"{opt/${pkgname},/usr/bin}
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/ipinfo" -t "${pkgdir}/opt/${pkgname}"
  ln -sf "/opt/${pkgname}/ipinfo" "${pkgdir}/usr/bin/ipinfo"
}