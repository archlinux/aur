# Maintainer: teaper <www@teaper.dev>

pkgname=xmind-pro
# the versin is from deb package
pkgver=10.1.2
_release=202004142327
pkgrel=1
pkgdesc="XMind - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('libxss' 'nss' 'libxtst' 'alsa-lib' 'gtk3')
provides=('xmind' "$pkgname")
conflicts=("$pkgname")
source=("https://dl2.xmind.cn/XMind-2020-for-Linux-amd-64bit-${pkgver}-${_release}.deb"
	"https://github.com/teaper/xmind-zen/releases/download/v${pkgver}/app.asar"
        'xmind.xml')

sha256sums=('ca19a6bddcb1ea547e905f12ce045a535235cac12058fc0adcf22bd222dc1638'
            '5797276b31775d83bb2ef4cd557b184da188cd784fd8e513c478ef98cc220510'
            '833f6f1a7ddd73ea2487a21390e16b57c3fa817a560f385a034efdd1ed754a8d')

package() {
    tar xf data.tar.xz -C ${pkgdir}/

    chmod 755 ${pkgdir}"/opt/XMind/" \
              ${pkgdir}"/opt/XMind/locales/" \
              ${pkgdir}"/opt/XMind/resources/"

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind/xmind" ${pkgdir}/usr/bin/xmind-pro

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/
    install -Dm644 app.asar ${pkgdir}/opt/XMind/resources/

    mv ${pkgdir}"/usr/share/applications/XMind.desktop" ${pkgdir}"/usr/share/applications/XMind-pro.desktop"

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-pro
    cp ${pkgdir}"/opt/XMind/resources/app.asar.unpacked/static/license/"license{-cn,}.pdf ${pkgdir}/usr/share/licenses/xmind-pro/
}
