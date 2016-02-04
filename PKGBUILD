# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=anyk
pkgver=2.68
pkgrel=1
pkgdesc="Form fill program of the hungarian tax office (Általános Nyomtatványkitöltő (ÁNYK))"
arch=('any')
url="http://nav.gov.hu/nav/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/abevjava_install.html"
license=('proprietary')
depends=('java-environment>=6')
provides=('abevjava')
source=("http://nav.gov.hu/data/cms36637/abevjava_install.jar")
md5sums=("5a9d1ea63ab2df58ecb07816e4ac5882")

package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/abevjava"
    install -d -m 755 "${pkgdir}/etc"

    cp -r ${srcdir}/application/* "${pkgdir}/usr/share/abevjava"
    install -m 655 ${startdir}/abevjava_* "${pkgdir}/usr/share/abevjava"
    install -m 655 ${startdir}/setenv "${pkgdir}/usr/share/abevjava"
    install -m 655 ${startdir}/abevjava "${pkgdir}/usr/bin"
    install -m 644 ${startdir}/abevjavapath.cfg "${pkgdir}/etc"
    find "${pkgdir}/usr/share/abevjava" -type f -follow -print | xargs -0 | sed -e "s|${pkgdir}||g" | tee -a ${pkgdir}/usr/share/abevjava/uninstall.enyk
    echo "/etc/abevjavapath.cfg" | tee -a ${pkgdir}/usr/share/abevjava/uninstall.enyk
}
