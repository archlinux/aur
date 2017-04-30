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
        'https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
sha256sums=('119d3c18dc401d6c1fd2c30a952b1d4078c7581fb9256c8acd5bf1db68d8e02f'
            '70f035e6fce48c59af195a76dc6b64e908f2fbb992588a5193736aa3382f84b4'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {
	cd "$srcdir"
	install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
	install -m644 -t "${pkgdir}/usr/lib/systemd/system" prelink.service prelink.timer
	ln -s ../prelink.timer "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/prelink.timer"
	install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
