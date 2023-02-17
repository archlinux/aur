# Maintainer:   fft <nobody@nowhere.no>
# Contributor:  Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codelobster
pkgver=2.3.0
pkgrel=1
pkgdesc='Free cross-platform IDE for PHP/HTML/CSS/JavaScript development'
arch=('x86_64')
url="https://www.codelobsteride.com"
license=("custom:${pkgname}")
provides=('codelobster-ide')
depends=(
         'curl'
         'libidn11'
         'libldap24'
         'libxcb'
         'nettle6'
         'rtmpdump'
         'qt5-websockets'
        )
source=(
        "https://codelobsteride.com/download/codelobsteride-${pkgver}_amd64.deb"
        'LICENSE'
       )
sha256sums=(
            '0f701e33236ae8631b2ff0bfb5e95af98311586191b0df815e3cf401f3464f89'
            '70ce1193a0036cff727f29e1c94bd3ddd61599993ba5d130491037b91158a73a'
           )

package() {
    tar xf data.tar.xz -C "${pkgdir}"
    cd "${pkgdir}/opt/codelobsteride"
    rm libasn1.so.8 libcrypto.so.1.1 libcurl.so.4 libhogweed.so.4 libidn.so.11 liblber-2.4.so.2 libldap_r-2.4.so.2 libnettle.so.6 librtmp.so.1 libssh.so.4 libssl.so.1.1 libxcb-* xcbglintegrations/libqxcb-xinerama.so.0
    find ./ -name "*.so*" -exec chmod -x {} +
    chmod a+r ./qt.conf
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm -r "${pkgdir}/usr/bin/codelobster~" "${pkgdir}/usr/share/applications/codelobsteride.desktop~"
    ln -sf "/opt/codelobsteride/CodeLobsterIDE" "${pkgdir}/usr/bin/codelobster"
}
