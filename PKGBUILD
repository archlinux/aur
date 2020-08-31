# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=clevis-git
pkgver=14.r0.44b7b6e
pkgrel=1
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
depends=('bash' 'jose')
makedepends=('git' 'meson' 'asciidoc' 'audit' 'bash-completion' 'cryptsetup' 'dracut' 'glib2'
             'jansson' 'libpwquality' 'luksmeta' 'openssl' 'tpm2-tools' 'udisks2')
checkdepends=('jq' 'tang')
optdepends=('audit: UDisks2 unlocker support'
            'cryptsetup: LUKS unlocker support'
            'curl: Tang pin support'
            'dracut: dracut unlocker support'
            'glib2: UDisks2 unlocker support'
            'jansson: SSS pin and UDisks2 unlocker support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'nmap: dracut unlocker support'
            'openssl: SSS pin support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	meson --prefix=/usr --libexecdir=/usr/lib --buildtype=plain build
	ninja -C build
}

check() {
	cd "${pkgname%-git}"
	ninja -C build test
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
