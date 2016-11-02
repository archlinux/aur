# Maintainer: Matt Harrison <matt@mistbyte.com>
# Contributor: Sergey Mamonov <mrqwer88@gmail.com>

pkgname=maldet
pkgver=1.5
pkgrel=1
pkgdesc="Linux Malware Detect"
url="https://www.rfxn.com/projects/linux-malware-detect/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('perl')
depends_x86_64=('lib32-glibc')

source=("http://www.rfxn.com/downloads/maldetect-$pkgver.tar.gz")
sha256sums=('1cb9e971aad4652349d81609dd66b6a2d51e415f410ea34e0d62fd402be1ffe7')

package() {
    echo "Warning! This package does not comply to the Arch packaging standarts"
    echo "Usage strongly discouraged, use at own risk!"
    false
    cd "${srcdir}/${pkgname}ect-${pkgver}"
    mkdir -p ${pkgdir}/usr/local/sbin
    mkdir -p ${pkgdir}/usr/lib
    mkdir -p ${pkgdir}/etc/cron.daily
    sed -i "s|/usr/|${pkgdir}/usr/|g" install.sh
    sed -i "s|/etc/|${pkgdir}/etc/|g" install.sh
    sed -i 's|$inspath/maldet --update|#$inspath/maldet --update|' install.sh
    sed -i 's|ln -fs $inspath/maldet|#ln -fs $inspath/maldet|' install.sh
    sh install.sh
    cd "${pkgdir}/usr/local/sbin/"
    ln -fs ../maldetect/maldet maldet
    ln -fs ../maldetect/maldet lmd
}
