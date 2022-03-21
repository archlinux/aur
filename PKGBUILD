# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=swhkd-bin
pkgver=1.1.7
pkgrel=1
pkgdesc='A display server independent hotkey daemon inspired by sxhkd'
arch=(x86_64)
url='https://github.com/waycrate/swhkd'
license=(BSD)
depends=(polkit)
provides=(swhkd)
conflicts=(swhkd-git swhkd-musl-git)
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/glibc-x86_64-$pkgver.zip"
        'https://raw.githubusercontent.com/waycrate/swhkd/main/00-swhkd.rules')
sha256sums=('2b293f6ee8486d5ab12f443fc7fef1b16a0891d6ae87f0f0138783a0182ad400'
            '2371b794faada1849a1cc9348a3f40551891a0f339fe3c0331ce8a486f4d2640')

package() {
    install -Dm 755 swhkd "$pkgdir/usr/bin/swhkd"
    install -Dm 755 swhks "$pkgdir/usr/bin/swhks"

    # match directory owner/group and mode from [extra]/polkit
    install -d -o root -g 102 -m 750 "$pkgdir"/etc/polkit-1/rules.d
    install -m 644 00-swhkd.rules "$pkgdir/etc/polkit-1/rules.d/00-swhkd.rules"
}
