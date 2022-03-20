# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=labbots/google-drive-upload
_source_type=github-releases
_upstreamver='v4.2'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view $_repo|rg 'description:\t'|cut -f2)"
arch=(any)
url=https://github.com/$_repo
license=(MIT)
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
source=("$_pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
sha256sums=('7c57720736884f26ea69d3a76a540f021e4e13dc84ba30f7081d5f7c69c7bda4')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D bash/release/* -t "$pkgdir/usr/bin"
}
