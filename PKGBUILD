# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=prelink-systemd
pkgver=1
pkgrel=1
pkgdesc='systemd units for prelink'
arch=('any')
url='https://github.com/Freso/PKGBUILDs'
license=('CC0')
depends=('prelink' 'systemd')
changelog=ChangeLog
source=('prelink.service'
        'prelink.timer'
        "${pkgname}-LICENSE::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
sha256sums=('491b50f8d012cef1b4621239c7867545fe4c5e76b05c443720d0dc2be0f3ea0a'
            '8ea60ee2373e41fb999ee63ae23ba39d4e2cea5a49b1d4246fcc8eae9817407f'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {
	cd "$srcdir"
	install -d -m755 "${pkgdir}/usr/lib/systemd/system/timers.target.wants"
	install -m644 -t "${pkgdir}/usr/lib/systemd/system" prelink.service prelink.timer
	ln -s ../prelink.timer "${pkgdir}/usr/lib/systemd/system/timers.target.wants/prelink.timer"
	install -D -m644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
