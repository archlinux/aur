# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=visage
pkgname="$_pkgbase-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc='Linux face authentication via PAM with persistent daemon, IR camera support, ONNX inference'
arch=('x86_64')
url='https://sovren.software/#/visage'
license=('MIT')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install='setup.install'
source_x86_64=("$_pkgbase-$pkgver.deb::https://github.com/sovren-software/$_pkgbase/releases/download/v$pkgver/${_pkgbase}_$pkgver-1_amd64.deb")
sha256sums_x86_64=('2e7ba072a20747ba7ffb1f59b93618968186df873350bdb1ec9569ef7ce9e795')

prepare() {
	bsdtar -xf "$_pkgbase-$pkgver.deb"
}

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	install -Dm0644 "$pkgdir/usr/share/doc/$_pkgbase/copyright" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	install -dm700 "$pkgdir/var/lib/visage/models"
	rm -rf "$pkgdir/usr/share/pam-configs"
}
