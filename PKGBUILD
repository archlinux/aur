# Maintainer: alpha0x00 <li_tking@163.com>
# Maintainer: WhiredPlanck

pkgname=xmind-zen
_name=XMind-2020
# the versin is from deb package
pkgver=10.1.2
_release=202004142327
pkgrel=2
pkgdesc="XMind 2020 (ZEN) - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('libxss' 'nss' 'libxtst' 'alsa-lib' 'gtk3' 'libxkbfile' 'nodejs')
conflicts=('xmind-zen')
replaces=('xmind-zen')
provides=('xmind' 'xmind-2020' 'xmind-zen')

source=("https://www.xmind.net/xmind/downloads/${_name}-for-Linux-amd-64bit-${pkgver}-${_release}.deb"
        'xmind.xml')

sha256sums=('ca19a6bddcb1ea547e905f12ce045a535235cac12058fc0adcf22bd222dc1638'
            '833f6f1a7ddd73ea2487a21390e16b57c3fa817a560f385a034efdd1ed754a8d')

package() {
    tar xf data.tar.xz -C ${pkgdir}/

    chmod 755 ${pkgdir}"/opt/XMind/" \
              ${pkgdir}"/opt/XMind/locales/" \
              ${pkgdir}"/opt/XMind/resources/"

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind/XMind" ${pkgdir}/usr/bin/xmind

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-2020
    cp ${pkgdir}"/opt/XMind/resources/app.asar.unpacked/static/license/"license{-cn,}.pdf ${pkgdir}/usr/share/licenses/xmind-2020/
}
