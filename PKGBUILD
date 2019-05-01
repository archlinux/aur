#!/bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>

_pkg_short_name='kaku'

pkgname=kaku-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Kaku is a highly integrated music player supports different online platform like YouTube, SoundCloud, Vimeo and more."
arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
conflicts=('kaku')
install='kaku-bin.install'
options=(!strip)

source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE" "http://kaku.rocks/public/img/logo.png")
source_x86_64=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver.tar.gz")
source_i686=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-ia32.tar.gz")

sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04' 'fbc59e8bc4b3e39bbdf75a824e3f1e3accd372bf1fda194ec433443feff88158a0df14cac0f3a1a3aef18ada98c3b02b40b5b254d1096ae28e3a84aace8b842f')
sha512sums_x86_64=('821e6afc3788bc556fb70370a3d827899ea49a1f677343737b5e5819f4fee3deaa00d55bb7afc997bb86b4d8ab43467bf2f42950eea3de8bf3a17ed6a4a1e839')
sha512sums_i686=('dcf7615318d6eeb30fc04a74a38bbcd31019ce890d96a1543417edaddc5f035e02079b395a22d2ba62e18e08c7491f9eff8d57cad6b43041f3b05ababafd1c55')

package() {
    install -d ${pkgdir}{/usr/share/applications,/usr/{bin,share/${pkgname}/}}

    if [ ${CARCH} == "x86_64" ]
    then
        cp -r ${srcdir}/Kaku-${pkgver}/* ${pkgdir}/usr/share/${pkgname}
    else
        cp -r ${srcdir}/Kaku-${pkgver}-ia32/* ${pkgdir}/usr/share/${pkgname}
    fi
    sed -i "s|Icon=/usr/share/kaku/logo.png|Icon=/usr/share/${pkgname}/logo.png|g" ${pkgdir}/usr/share/${pkgname}/misc/linux/*.desktop

    install -Dm644 ${srcdir}/logo.png ${pkgdir}/usr/share/${pkgname}/
    install -Dm644 ${pkgdir}/usr/share/${pkgname}/misc/linux/kaku.desktop ${pkgdir}/usr/share/applications/
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    chgrp -R audio ${pkgdir}/usr/share/${pkgname}
    chmod -R 775 ${pkgdir}/usr/share/${pkgname}

    ln -s /usr/share/${pkgname}/kaku ${pkgdir}/usr/bin/${_pkg_short_name}
}
