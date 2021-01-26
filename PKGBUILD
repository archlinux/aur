# Maintainer: alpha0x00 <li_tking@163.com>
# Maintainer: WhiredPlanck
# Maintainer: teaper <www@teaper.dev>

pkgname=xmind-zen
_name=XMind-ZEN
# the versin is from deb package
pkgver=10.0.0
_release=201911260056
pkgrel=3
pkgdesc="XMind 2020 (ZEN) - The most popular mind mapping software"
arch=("x86_64")
url="https://www.xmind.net/"
license=('custom')
depends=('libxss' 'nss' 'libxtst' 'alsa-lib' 'gtk3' 'libxkbfile' 'nodejs')
conflicts=('xmind-zen')
replaces=('xmind-zen')
provides=('xmind' 'xmind-2020' 'xmind-zen')

source=("https://dl3.xmind.net/${_name}-for-Linux-amd-64bit-${pkgver}-${_release}.deb"
	'https://github.com/teaper/xmind-zen/releases/download/v10.0.0/app.asar'
        'xmind.xml')

md5sums=('658008c171d64021dad0fd88db8329c4'
         'c4cf9c905b7cd5f498ea45aa2cfc56eb'
         '79ce427cd9d4facd4cddf8ebf68f2d5f')

package() {
    tar xf data.tar.xz -C ${pkgdir}/

    chmod 755 ${pkgdir}"/opt/XMind ZEN/" \
              ${pkgdir}"/opt/XMind ZEN/locales/" \
              ${pkgdir}"/opt/XMind ZEN/resources/"

    mkdir -p ${pkgdir}/usr/bin/
    ln -s "/opt/XMind ZEN/xmind" ${pkgdir}/usr/bin/xmind-zen

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install -Dm644 xmind.xml ${pkgdir}/usr/share/mime/packages/
    install -Dm644 app.asar ${pkgdir}/opt/XMind\ ZEN/resources/

    #mv ${pkgdir}"/usr/share/applications/xmind.desktop" ${pkgdir}"/usr/share/applications/xmind-zen.desktop"

    mkdir -p ${pkgdir}/usr/share/licenses/xmind-zen
    cp ${pkgdir}"/opt/XMind ZEN/resources/app.asar.unpacked/static/license/"license{-cn,}.pdf ${pkgdir}/usr/share/licenses/xmind-zen/
}
