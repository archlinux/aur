# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=endpoint-verification-minimal
_upstream_pkgname=endpoint-verification
pkgver=2020.09.29.c334423510_00
_upstream_pkgver=2020.09.29.c334423510-00
pkgrel=1
pkgdesc="Endpoint Verification Helper for Chrome"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
depends=(google-chrome)
# NB: This is unchanged from "older" version 2019.10.07.c273328186_00 also packaged in AUR
sha256sums=("74682ecaa214a1cc192cd9be4be64f5b3762caf53e7a3376e103d11c7c37424a")
# source.split("_")[0] has no effect, can be empty
source=("${_upstream_pkgname}.deb::https://packages.cloud.google.com/apt/pool/${_upstream_pkgname}_${_upstream_pkgver}_amd64_${sha256sums[0]}.deb")

prepare() {
	tar xf data.tar.gz
}

_json=etc/opt/chrome/native-messaging-hosts
_bin=opt/google/endpoint-verification/bin

package() {
	mkdir -p "$pkgdir/$_json"
	cp -a "$srcdir/$_json/com.google.secure_connect.native_helper.json" "$pkgdir/$_json"
	cp -a "$srcdir/$_json/com.google.endpoint_verification.api_helper.json" "$pkgdir/$_json"

	mkdir -p "$pkgdir/$_bin"
	cp -a "$srcdir/$_bin/apihelper" "$pkgdir/$_bin"
	cp -a "$srcdir/$_bin/SecureConnectHelper" "$pkgdir/$_bin"
}
