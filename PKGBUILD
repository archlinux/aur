# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=xxf098/LiteSpeedTest
_source_type=github-releases
_upstreamver='v0.8.0'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view $_repo|rg 'description:\t'|cut -f2)"
arch=(i386 x86_64)
url=https://github.com/$_repo
license=(GPL)
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
_arch="$(uname -m|sed s/x86_64/amd64/)"
_os="${OSTYPE%%-*}"
[[ $_os == windows ]] && _ext=zip || _ext=gz
source=("$_pkgname-$pkgver::$url/releases/download/$_upstreamver/lite-${_os}-${_arch}-${_upstreamver}.$_ext")
sha256sums=('195d8c88a9ae93b4007b3fddb92500eb1272a1e8f63e6e76301111e2479a4be4')

package() {
	cd "$srcdir"
	cp -L "$_pkgname-$pkgver" "$_pkgname-$pkgver".$_ext
	[[ $_ext == gz ]] && gunzip -f "$_pkgname-$pkgver".$_ext
	install -D "$_pkgname-$pkgver" -T "$pkgdir/usr/bin/lite"
}
