# $Id$
# Maintainer: notvidya <transient.sepia // at // gmail dot com>
# Contributor: physkets <physkets // at // tutanota dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

pkgname=armagetronad-experimental-bin
_pkgname=armagetronad-experimental
_pkgname2=armagetronad
pkgver=0.4.0.alpha.z5868
pkgrel=1
pkgdesc='A Tron Clone in 3D.'
arch=('x86_64')
url='https://www.armagetronad.org'
license=('GPL')
depends=()
provides=($_pkgname)
conflicts=('armagetronad-git')

_package_id="179608348"
_download_url="https://gitlab.com/armagetronad/armagetronad/-/package_files/$_package_id/download"
_target="ArmagetronExperimental.AppImage"
_squashfs_root="squashfs-root"

source=(
    "$_target::$_download_url"
    "$_pkgname.bash"
)
sha256sums=(
    'd674f60e51c8ab959df2a5bbb315aa7502d13ff75777a089c7d1c2b3ccf473b4'
    '3557d1037871700f2008e23913570b77b1ba232f669875df10dc81be80710b25'
)

prepare() {
    echo -ne 'Extracting the AppImage... '
    rm -rf $_squashfs_root
    chmod +x $_target
    ./$_target --appimage-extract &>/dev/null
    find $_squashfs_root -type d -exec chmod g+rX,a+rX {} \;
    chmod +x $_squashfs_root/AppRun
    echo 'done'
}

package() {
    mkdir -p $pkgdir/opt/$_pkgname
    cp -rf ./$_squashfs_root $pkgdir/opt/$_pkgname
    install -Dm644 ./$_squashfs_root/org.$_pkgname2.$_pkgname.desktop -t $pkgdir/usr/share/applications
    install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
