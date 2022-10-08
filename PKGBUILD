pkgname=bigbashview
pkgver=$(curl https://raw.githubusercontent.com/biglinux/bigbashview/master/bigbashview/usr/lib/python3/dist-packages/bbv/globaldata.py | grep APP_VERSION  | cut -f2 -d\")_$(date +"%Y_%m_%d")
pkgrel=2
arch=('any')
license=('GPL')
url="https://github.com/biglinux/bigbashview"
pkgdesc="BigBashView is a python app to run Bash+HTML in a Desktop WebView"
depends=('pyside6' 'python-six' 'webkit2gtk-4.1' 'qt6-webengine')
source=("git+https://github.com/biglinux/bigbashview.git")
md5sums=(SKIP)

package() {
    mkdir -p "${pkgdir}/usr" "${pkgdir}/usr/lib"
    cp -r "${srcdir}/bigbashview/bigbashview/usr/" "${pkgdir}/"
    mv "${pkgdir}/usr/lib/python3/dist-packages/bbv/" "${pkgdir}/usr/lib/bbv/"
    rm -Rf "${pkgdir}/usr/lib/python3"
    sed -i 's|/usr/lib/python3/dist-packages/bbv/|/usr/lib/bbv/|g' "${pkgdir}/usr/bin/bigbashview"
}
