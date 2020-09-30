# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=endpoint-verification-minimal
_upstream_pkgname=endpoint-verification
pkgver=2020.08.25.c328417887_00
_upstream_pkgver=2020.08.25.c328417887-00
pkgrel=1
pkgdesc="Endpoint Verification Helper for Chrome"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
depends=(google-chrome)
# NB: This is unchanged from "older" version 2019.10.07.c273328186_00 also packaged in AUR
sha256sums=("466d329b82384574a5b062adcd6312623918ac27c5ea3999985856366735bdca")
# source.split("_")[0] has no effect, can be empty
source=("${_upstream_pkgname}.deb::https://packages.cloud.google.com/apt/pool/${_upstream_pkgname}_${_upstream_pkgver}_amd64_${sha256sums[0]}.deb")

prepare() {
	tar xf data.tar.gz
}

_nmh=etc/opt/chrome/native-messaging-hosts
_epv=opt/google/endpoint_verification
_bin=usr/bin

package() {
	mkdir -p "$pkgdir/$_nmh"
	cp -a "$srcdir/$_nmh/com.google.secure_connect.native_helper.json" "$pkgdir/$_nmh"
	mkdir -p "$pkgdir/opt/google/endpoint_verification"
	cp -a "$srcdir/$_epv/device_state.sh" "$pkgdir/$_epv"
	mkdir -p "$pkgdir/$_bin"
	cp -a "$srcdir/$_bin/SecureConnectHelper" "$pkgdir/$_bin"
}
