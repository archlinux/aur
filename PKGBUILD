# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname="vconsole-colors"
pkgdesc="Simple utility for setvtrgb from kbd"

pkgver=1.0
pkgrel=1

url="https://github.com/GaKu999/$pkgname"
arch=("any")
license=("Unlicense")
#backup=()
#install="$pkgname.install"
#options=()

#conflicts=()
#replaces=()
#provides=()

#makedepends=()
depends=("bash" "coreutils" "kbd")
#optdepends=()

validpgpkeys=("B6F1C3E092DA04BB7371D4F202471E1B7E9034B2") # GaKu999 <gaku999 [at] posteo [dot] net>

source=("https://github.com/GaKu999/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/GaKu999/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.sig")

sha512sums=("0854cce9d4c06a81316da105005c4b7de9c0de336dc8df8afdc878f3eaa983e2d61d85882edda5a99a1c9e77e9cb143c07f46f6c5e362e0619eb5f99b39296c5"
            "SKIP")
b2sums=("35309c6e646de294e92c973f35ec212d009cdeafa9f1f9f1f5daaa92d8e02c607645a3c664a07eca6655cb5935758c17b737403bf15f7d36749231cdf12384ea"
        "SKIP")

package() {
	cd "./$pkgname-$pkgver"

	install -D -m 0755 -t "$pkgdir/usr/bin" ./vconsole-colors

	install -D -m 0644 -T ./mkinitcpio/busybox-hook    "$pkgdir/usr/lib/initcpio/hooks/consolecolors"
	install -D -m 0644 -T ./mkinitcpio/busybox-install "$pkgdir/usr/lib/initcpio/install/consolecolors"

	install -D -m 0644 -T ./mkinitcpio/systemd-install "$pkgdir/usr/lib/initcpio/install/sd-vconsole-colors"

	install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/initrd-vconsole-colors.service
	install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" ./systemd/vconsole-colors.service
}
