# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=raspotify
pkgname=$_pkgname-bin
pkgver=0.47.0
_libver=v0.7.1-987dfa5
pkgrel=1
pkgdesc='A Spotify Connect client that mostly Just Works (librespot)'
arch=(x86_64 aarch64 armv7h)
url='https://dtcooper.github.io/raspotify'
license=(MIT)
depends=(alsa-lib gcc-libs libpulse bash glibc)
optdepends=(avahi)
provides=($_pkgname)
conflicts=($_pkgname)
backup=(etc/raspotify/conf)
source_x86_64=( https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_amd64.deb)
source_aarch64=(https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_arm64.deb)
source_armv7h=( https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_armhf.deb)
sha256sums_x86_64=('6a7039761646dbce3db65c9c443fce2023cef6fde700a2173595da3ef644df2d')
sha256sums_aarch64=('a816deee47d856124015ab394d5e228af21c7eec8fd137d99b3f73dc843ab7c4')
sha256sums_armv7h=('b6afeb536f1b8894a417a49ebafe13a3f3d8241d5a2ad7ebf2c6563469165de1')

package() {
	bsdtar --no-same-owner -xpJf data.tar.xz -C "$pkgdir"
	mv "$pkgdir"/lib "$pkgdir"/usr
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "$pkgdir"/usr/share/doc/raspotify/*copyright
	chmod 600 "$pkgdir"/etc/raspotify
}
