# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
pkgname=mirage
pkgver=0.9.5.2
pkgrel=4
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=("GPL")
depends=('pygtk' 'desktop-file-utils')
arch=('x86_64')
md5sums=('92191a4496b0a50486ed7299baf6729f'
         '1315594c262c23079e46d0b6a9896bfd')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2
        mirage-0.9.5.2-glib241-init-workaround.patch)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Don't call gtk.gdk.threads_init() on GLib >= 2.41 (patch from Fedora)
    # https://bugs.archlinux.org/task/42189
    patch -Np1 -i ../mirage-0.9.5.2-glib241-init-workaround.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py build
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}
