# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=sunlesssea-hib
pkgver=2016.03.29
pkgrel=1
pkgdesc="Sunless Sea is a nautical roguelike in glorious 2D, presenting a non-linear, choice-heavy, personalised experience. Humblebundle version."
url="http://www.failbettergames.com/sunless/"
arch=('any')
license=('commercial')
depends=("lib32-libxcursor")
source=("hib://Sunless_Sea-StandAlone-Linux-2016-03-29.sh")
md5sums=('b82055a5e48ffe7188309ce28a003b98')
PKGEXT=.pkg.tar
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
    # copy files
    install -Dm755 "${srcdir}/data/x86/Sunless Sea.x86" "${pkgdir}/opt/sunlesssea/Sunless Sea.x86"
    cp -R "${srcdir}/data/noarch/Sunless Sea_Data" "${srcdir}/data/noarch/Icon.png" "${pkgdir}/opt/sunlesssea/"

    # starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/sunlessea" << \here
#!/usr/bin/bash
cd /opt/sunlesssea
Sunless\ Sea.x86
here
    chmod a+x "${pkgdir}/usr/bin/sunlessea"
}
