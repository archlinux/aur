# NOTE: You must manually download "xp9.8.0_linux_x86_64_setup.tar" from:
# https://www.fico.com/en/fico-xpress-community-license
# And place it in the same directory where you're going to compile this package (or in ~/.cache/yay/fico-xpress-bin/ if you're using yay).

pkgname=fico-xpress-bin
pkgver=9.8.0
pkgrel=1
pkgdesc="FICO Xpress Optimization Suite (Mosel & Solver)"
arch=('x86_64')
url="https://www.fico.com/en/fico-xpress-community-license"
license=('custom:commercial')
depends=('gcc-libs' 'bash')
provides=('fico-xpress')
conflicts=('fico-xpress')
options=('!strip')

# Manual download is required due to the FICO website firewall.
source=("local://xp${pkgver}_linux_x86_64_setup.tar")
sha256sums=('7984e5476b0dde4e8c1995c1c0057bd4ebc43d5484de6c05cca8846d01734c8b')

package() {
    cd "${srcdir}/xp${pkgver}_linux_x86_64_setup"

    install -dm755 "${pkgdir}/opt/xpressmp"

    ./install.sh \
        --no-interactive \
        --license-type community \
        --components full \
        --accept-xpress-license \
        --accept-kalis-license \
        --install-path "${pkgdir}/opt/xpressmp"

    sed -i "s|${pkgdir}||g" "${pkgdir}/opt/xpressmp/bin/xpvars.sh"
    sed -i "s|${pkgdir}||g" "${pkgdir}/opt/xpressmp/bin/xpvars.csh"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/xpressmp/bin/mosel" "${pkgdir}/usr/bin/mosel"
}

