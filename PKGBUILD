# Maintainer: Jonathon Fernyhough <jonathon+at m2x.dev>
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=14
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="https://radiotray.wordpress.com/"
license=(GPL)
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'python2-dbus' 'python2-gobject' 'python2-lxml' 'python2-notify' 'python2-xdg')
optdepends=('gst-plugins-bad: extra codec support'
            'gst-plugins-ugly: extra codec support'
            'gst-libav: nonfree media decoding'
            'libappindicator-gtk3: indicator applet support')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/radiotray/files/releases/${pkgname}-${pkgver}.tar.gz/download/"
        "encoding.patch"
        "02_compatibility_glib-2.41.patch"
        "03_upstream_repo.patch"
        "04_gtk3_issues.patch"
        "reduce-logging.patch")

sha256sums=('709cbabbd03627270f60cd56084803d6f03fe0e14fbfc15b6325b4c5bd9faf2d'
            'a73badc0ddbf726d3f554e328b8836883bf816751cd0dc2034795a03466cd2df'
            'b6d1d7fe74be1ec2ecad653262111f509d6fd60b8e666eb5e15d7bcb21e7a58b'
            '04748958923e3c2cac8944700a0786d066ab17d8284155adf316adab78dd0c55'
            'c67845683a6d7d63eb26bbefe3c06921e0e6cbc2a5cb32c58b47377fdeb83644'
            '231ec3fb848069cf909f704e0e129fd649a9f8955178fe5407c7457d94ab0663')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 < "${srcdir}/encoding.patch"
    patch -Np1 < "${srcdir}/02_compatibility_glib-2.41.patch"
    patch -Np1 < "${srcdir}/03_upstream_repo.patch"
    patch -Np1 < "${srcdir}/04_gtk3_issues.patch"
    patch -Np1 < "${srcdir}/reduce-logging.patch"
}

package() {
    cd $pkgname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
