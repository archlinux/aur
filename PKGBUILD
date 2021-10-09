# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickemu
pkgver=2.2.3
pkgrel=2
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines."
arch=(any)
url="https://github.com/wimpysworld/quickemu"
license=('MIT')
depends=('qemu' 'cdrtools' 'swtpm' 'edk2-ovmf')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/wimpysworld/quickemu/archive/refs/tags/2.2.3.tar.gz')
md5sums=("38cbaa95a18a6c98b9444a49263c64d4")

prepare() {
  sed -i 's+/usr/share/OVMF/OVMF_CODE_4M.fd+/usr/share/OVMF/x64/OVMF_CODE.fd+g' $srcdir/$pkgname-$pkgver/quickemu
  sed -i 's+/usr/share/OVMF/OVMF_VARS_4M.fd+/usr/share/OVMF/x64/OVMF_VARS.fd+g' $srcdir/$pkgname-$pkgver/quickemu
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 quickemu "$pkgdir/usr/bin/quickemu"
	install -Dm755 macrecovery "$pkgdir/usr/bin/macrecovery"
	install -Dm755 quickget "$pkgdir/usr/bin/quickget"
}
