# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=10
_commit=1717a0e8c143
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="https://radiotray.wordpress.com/"
license=(GPL)
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-python2' \
         'pygtk' 'python2-notify' 'python2-xdg' 'python2-dbus' \
         'python2-gobject' 'python2-lxml')
optdepends=('gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav') 
makedepends=(python2)
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/carlmig/radio-tray/get/${pkgname}-${pkgver}.tar.gz"
        "encoding.patch"
        "02_compatibility_glib-2.41.patch"
        "03_upstream_repo.patch"
        "04_gtk3_issues.patch")
conflicts=(radiotray-hg radiotray-python3-git)

sha256sums=('464c555b8d9278e918d3718f81a1c0cfa7d9a54018d1a2f6b04b33dc40ea825c'
            'a73badc0ddbf726d3f554e328b8836883bf816751cd0dc2034795a03466cd2df'
            'b6d1d7fe74be1ec2ecad653262111f509d6fd60b8e666eb5e15d7bcb21e7a58b'
            '04748958923e3c2cac8944700a0786d066ab17d8284155adf316adab78dd0c55'
            'c67845683a6d7d63eb26bbefe3c06921e0e6cbc2a5cb32c58b47377fdeb83644')

prepare() {
    cd "${srcdir}/carlmig-radio-tray-${_commit}"
    patch -p1 < "${srcdir}/encoding.patch"
    patch -p1 < "${srcdir}/02_compatibility_glib-2.41.patch"
    patch -p1 < "${srcdir}/03_upstream_repo.patch"
    patch -p1 < "${srcdir}/04_gtk3_issues.patch"
}

build() {
    cd "${srcdir}/carlmig-radio-tray-${_commit}"
    python2 setup.py bdist
}

package() {
    cd "${srcdir}/carlmig-radio-tray-${_commit}"
    tar xf "dist/${pkgname}-${pkgver}.linux-${CARCH}.tar.gz" -C "${pkgdir}"
    chown -R root: ${pkgdir}
}

