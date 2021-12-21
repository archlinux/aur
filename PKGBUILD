# Maintainer: alpha0x00 <li_tking@163.com>
# Maintainer: lightning1141 <lightning1141@gmail.com>

pkgname=xmind-2020
# the versin is from deb package
pkgver=11.1.2
pkgrel=0
pkgdesc="XMind - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('libxss' 'nss' 'libxtst' 'alsa-lib' 'gtk3')
provides=('xmind' "$pkgname")
conflicts=("$pkgname")
source=("https://dl3.xmind.net/XMind-for-Linux-x86-64bit-$pkgver-202111151820.rpm"
        'xmind-2020.xml')

sha256sums=('SKIP'
            '833f6f1a7ddd73ea2487a21390e16b57c3fa817a560f385a034efdd1ed754a8d')

package() {
    cp -a ${srcdir}/opt ${pkgdir}/opt
    cp -a ${srcdir}/usr ${pkgdir}/usr

    chmod 755 ${pkgdir}"/opt/XMind/" \
              ${pkgdir}"/opt/XMind/locales/" \
              ${pkgdir}"/opt/XMind/resources/"

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind/xmind" ${pkgdir}/usr/bin/xmind-2020

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind-2020.xml ${pkgdir}/usr/share/mime/packages/

    sed -i 's/Name=XMind/Name=XMind-2020/g' ${pkgdir}"/usr/share/applications/xmind.desktop"
    mv ${pkgdir}"/usr/share/applications/xmind.desktop" ${pkgdir}"/usr/share/applications/xmind-2020.desktop"

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-2020
    cp ${pkgdir}"/opt/XMind/resources/app.asar.unpacked/static/license/"license{-cn,}.pdf ${pkgdir}/usr/share/licenses/xmind-2020/
}
