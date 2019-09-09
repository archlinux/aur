# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=clean-lang-bin
pkgver=3.0
pkgrel=1
pkgdesc="Clean is a general purpose, pure and lazy functional programming language."
arch=('x86_64')
url="https://clean.cs.ru.nl"
license=('custom:CLEAN')
depends=('glibc')
conflicts=('clean-lang')
provides=('clean-lang')
replaces=('clean-lang')
source=("https://ftp.cs.ru.nl/Clean/Clean30/linux/clean${pkgver}_64.tar.gz")
sha256sums=('c71024cc6d27df357fed771a75f5d43e584369c3ee963bfd6d5cffe9af731ca8')

package() {
	cd "${pkgname/-lang-bin/}"

    # install the main files (does a bit of compiling as well...)
	make INSTALL_DIR="$pkgdir/usr" INSTALL_MAN_DIR="$pkgdir/usr/share" install

    # resolve permissions on binaries
    chmod go+r "$pkgdir/usr/bin/BatchBuild" "$pkgdir/usr/bin/clm" \
        "$pkgdir/usr/bin/htoclean" "$pkgdir/usr/lib/exe/cg" \
        "$pkgdir/usr/lib/exe/cocl" "$pkgdir/usr/lib/exe/linker"

    # install license
    install -Dm644 CleanLicenseConditions.txt "$pkgdir/usr/share/licenses/${pkgname}/CleanLicenseConditions.txt"
}
