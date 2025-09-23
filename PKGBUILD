# Maintainer: Trix <admin@trix.is-a.dev>
# Contributor:  GasparVardanyan <gaspar_pm@proton.me>
pkgname='awcc-git'
pkgrel=1
pkgver=r143.a76b818
pkgdesc="An unofficial alternative to Alienware Command Centre of Windows for the Dell G series"
arch=('x86_64')
url="https://github.com/tr1xem/AWCC"
license=('MIT')
depends=('acpi_call-dkms' 'libusb' 'pcre2' 'systemd-libs' 'glibc' 'libcap' 'gcc-libs')
makedepends=('git' 'make')
provides=("awcc")
install='awcc.install'
source=('awcc::git+https://github.com/tr1xem/AWCC.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm755 "./awcc" "$pkgdir/usr/bin/awcc"
    install -Dm755 "./awccd" "$pkgdir/usr/bin/awccd"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "./systemd/awccd.service" "$pkgdir/usr/share/awcc/awccd.service"
}
