# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Frederik Alkærsig (FALKER) <havnelisten AT gmail.com>

pkgname=thinkfan
pkgver=0.9.2
pkgrel=2
pkgdesc="A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('libatasmart')
optdepends=('lm_sensors: hwmon support')
license=('GPL')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz
        "thinkfan.install" "thinkfan.service" "thinkpad_acpi.conf")
url="http://thinkfan.sourceforge.net/"
install="thinkfan.install"
md5sums=('4292633aebd61b91f04cd332c4d3e181'
         '76553f63dc55a6e09a429bb4e28eb649'
         '656b3721d0fccd770f615531f50ce0aa'
         'bca920d066846e5811a2465aefa13012')

build() {
    cd ${srcdir}
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUSE_ATASMART:BOOL=ON
    make
}

package() {
    cd ${srcdir}
    install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -D -m644 ${srcdir}/thinkpad_acpi.conf ${pkgdir}/usr/lib/modprobe.d/thinkpad_acpi.conf
    install -D -m644 README ${pkgdir}/usr/share/doc/${pkgname}/README
    install -D -m644 NEWS ${pkgdir}/usr/share/doc/${pkgname}/NEWS
    install -D -m644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
    install -D -m644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
    cp -r examples ${pkgdir}/usr/share/doc/${pkgname}/
}

# vim:set ts=2 sw=2 noet:
