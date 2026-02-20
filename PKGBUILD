# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# KB: https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk65210
# Download page: https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824

pkgname=snx
pkgdesc="Check Point SSL Network Extender (VPN Client)"
pkgver="800008409"
pkgrel=1
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
    'local://snx_install.sh'
)

sha256sums=(
    1e34ec888fba9f27c7576c4beacb47a6221c6da56ffc9741f2e5181855fb5a25
)

prepare() {
    # ARCHIVE_OFFSET FROM snx_install.sh FILE
    ARCHIVE_OFFSET=103

    tail -n +$ARCHIVE_OFFSET "${srcdir}/snx_install.sh" > "${srcdir}/snx.tar.bz2"

    cd "${srcdir}"
    tar -xvf ./snx.tar.bz2
}

package() {
    install -D -m0755 "${srcdir}/snx" "${pkgdir}/usr/bin/snx"
    install -d -m0700 "${pkgdir}/etc/snx"
    install -d -m0700 "${pkgdir}/etc/snx/tmp"
}
