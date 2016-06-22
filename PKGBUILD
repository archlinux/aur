# Upwork-appimage: the Upwork team app in an AppImage.
# Nearly all dependencies are pulled from an Ubuntu Trusty install,
# with a few dependent upon system deps.
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so I'm picking /opt/appimages.  So there.
# We grab upwork.png and upwork.desktop from the AppImage, patch the upwork.desktop,
# and install them as we would other apps, for convenience sake.
# Maintainer: Shane Simmons <regeya@gmail.com>

pkgname=upwork-appimage
pkgver=4.1.321.0
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('x86_64')
url="https://github.com/regeya/upwork-appimage/releases/"
license=('unknown')
conflicts=('upwork-beta' 'upwork-alpha' 'upwork')
depends=('gtk2' 'alsa-lib' 'glu' 'p7zip' 'fuse')
noextract=('Upwork.AppImage')
install=upwork-appimage.install
options=('!strip')

source_x86_64=('https://github.com/regeya/upwork-appimage/releases/download/v4.1.321.0.1/Upwork.AppImage')
md5sums_x86_64=('43af230938d5e3f85081b668cf2822d3')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/Upwork.AppImage" upwork.png
    7z x "${srcdir}/Upwork.AppImage" upwork.desktop
    mkdir -p usr/share/pixmaps
    mkdir -p usr/share/applications
    mkdir -p opt/appimages
    mv upwork.png usr/share/pixmaps
    patch -Np0 <../upwork.patch
    mv upwork.desktop usr/share/applications
    cp Upwork.AppImage opt/appimages/
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}
