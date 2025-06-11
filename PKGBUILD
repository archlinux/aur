# Maintainer: Petr Kracik <petrkr@petrkr.net>
# Based on dbeaver-ee maintaned by John Sivak <jsivak@winterjewel.com>

pkgname=dbeaver-le
pkgver=25.1.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Lite Edition"
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime=21' 'gtk3' 'gtk-update-icon-cache')
install=dbeaver-le.install
options=('!strip')

source=(dbeaver-le.desktop dbeaver-le.install dbeaver.sh)
source_x86_64=(http://dbeaver.com/downloads-lite/${pkgver}/dbeaver-le-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz)
sha256sums=('9d985ebe0332caf09fdee3fbe1e97b4f29533fe84911df46556623dff457a4ee'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f'
            '759a3543f304f06838b20f68de391291710001b53187b337d80021394ca5312b')
sha256sums_x86_64=('bfcd59bf5c75ed7e5e376fbb1024999422e7805872019ec29c3463260a98844e')


package() {
    cd $pkgdir
    mkdir -p "opt"
    mkdir -p "usr/bin"
    mkdir -p "usr/share/doc/${pkgname}"
    mkdir -p "usr/share/licenses"
    mkdir -p "usr/share/applications"
    mkdir -p "usr/share/icons/hicolor/48x48/apps"

    cp -r "${srcdir}/dbeaver" "opt/${pkgname}"
    cp "opt/${pkgname}/icon.xpm" "usr/share/icons/hicolor/48x48/apps/${pkgname}.xpm"
    cp "${srcdir}/dbeaver/readme.txt" "usr/share/doc/${pkgname}/"
    cp -r "${srcdir}/dbeaver/licenses" "usr/share/licenses/${pkgname}"

    ln -s "/opt/${pkgname}/dbeaver.sh" "usr/bin/dbeaver-le"
    install -m 644 "${srcdir}/dbeaver-le.desktop" "usr/share/applications/"
}
