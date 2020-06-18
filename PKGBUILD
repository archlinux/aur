# Maintainer: Pavan Dayal <dayalpavan@gmail.com>

pkgname=j901-bin
pkgver=9.01
pkgrel=1
pkgdesc="J is a modern, high-level, general-purpose, high-performance programming language"
arch=('x86_64')
url="http://www.jsoftware.com"
license=('GPL3'  'LGPL')
optdepends=(
    'wget: for web/gethttp addon'
    'expat: for api/expat addon'
    'fftw: for math/fftw addon'
    'lapack: for math/lapack addon'
)
source=('j901_amd64.deb::https://www.jsoftware.com/download/j901/install/j901_amd64.deb')
md5sums=('11bad3e0c45bb8fb3664d5602ba7a687')
provides=('ijconsole')
install="j.install"

prepare() {
    rm -rf ${srcdir}/data/
    mkdir -p ${srcdir}/data/
    tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/data
}

package() {
    cd ${srcdir}/data
    mkdir -p ${pkgdir}/usr/lib/
    cp usr/lib/x86_64-linux-gnu/libj.so.${pkgver} ${pkgdir}/usr/lib/
    ln -s libj.so.${pkgver} ${pkgdir}/usr/lib/libj.so
    cp -a usr/bin/ ${pkgdir}/usr/
    cp -a usr/share/ ${pkgdir}/usr/
    sed -i -r "s|^(user=\.\s+home,)userx(\s+.*)|\1'/\.j901-user'\2|" etc/j/${pkgver}/profilex_template.ijs
    install -Dm644 etc/j/${pkgver}/profile.ijs ${pkgdir}/etc/j/${pkgver}/profile.ijs
    install -Dm644 etc/j/${pkgver}/profilex_template.ijs ${pkgdir}/etc/j/${pkgver}/profilex.ijs
    install -Dm644 usr/share/j/${pkgver}/ijconsole.desktop ${pkgdir}/usr/share/applications/ijconsole.desktop
    install -Dm644 usr/share/j/${pkgver}/icons/jgreen.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/jgreen.png
}
