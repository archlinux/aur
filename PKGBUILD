# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# KB: https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk65210
# Download page: https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824

pkgname=snx
pkgdesc="Check Point SSL Network Extender (VPN Client)"
pkgver=800010003
pkgrel=5
arch=('x86_64')
url="https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824"
license=('unknown')
depends=(
    'lib32-pam'
    'lib32-libstdc++5'
    'lib32-libx11'
)
install=snx.install

source=(
    'local://snx_install_linux30.sh'
)

sha256sums=(
    20942e263f14e8d08e2e97dd6470f0c04018b06209645ae51bcc7269bb70bd58
)

prepare() {
    # ARCHIVE_OFFSET FROM snx_install.sh FILE
    ARCHIVE_OFFSET=80

    tail -n +$ARCHIVE_OFFSET "${srcdir}/snx_install_linux30.sh" > "${srcdir}/snx.tar.bz2"

    cd "${srcdir}"
    tar -xvf ./snx.tar.bz2
}

package() {
    install -D -m0755 "${srcdir}/snx" "${pkgdir}/usr/bin/snx"
    install -d -m0700 "${pkgdir}/etc/snx"
    install -d -m0700 "${pkgdir}/etc/snx/tmp"
}
