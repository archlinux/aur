_name=gegl
pkgname=${_name}-light
pkgver=0.4.40
pkgrel=1
pkgdesc='Graph based image processing framework (stripped to bare minimum for GIMP to run)'
arch=('x86_64')
url='https://www.gegl.org/'
license=('GPL3' 'LGPL3')

depends=('babl' 'json-glib' 'exiv2' 'libpng' 'libjpeg' 'cairo')
makedepends=('meson' 'intltool' 'gobject-introspection')
provides=("${_name}")
conflicts=("${_name}")

_tag="GEGL_${pkgver//./_}"
_snapshot="${_name}-${_tag}"

source=("${_snapshot}.tar.gz::https://gitlab.gnome.org/GNOME/${_name}/-/archive/${_tag}/${_snapshot}.tar.gz")
sha256sums=('8f6d5500a65e9e9688cfed81f6a9402198b26c88b2381433a14c0425dc292089')

build() {
    local options=(
        -Ddocs=false
        -Dintrospection=true
        -Dvapigen=disabled
        -Dgdk-pixbuf=disabled
        -Dgexiv2=disabled
        -Dgraphviz=disabled
        -Djasper=disabled
        -Dlcms=disabled
        -Dlensfun=disabled
        -Dlibav=disabled
        -Dlibraw=disabled
        -Dlibrsvg=disabled
        -Dlibspiro=disabled
        -Dlibtiff=disabled
        -Dlibv4l=disabled
        -Dlibv4l2=disabled
        -Dlua=disabled
        -Dmrg=disabled
        -Dmaxflow=disabled
        -Dopenexr=disabled
        -Dopenmp=disabled
        -Dcairo=enabled
        -Dpango=disabled
        -Dpangocairo=disabled
        -Dpoppler=disabled
        -Dpygobject=disabled
        -Dsdl1=disabled
        -Dsdl2=disabled
        -Dumfpack=disabled
        -Dwebp=disabled
    )

    arch-meson --buildtype=release \
        "${options[@]}" "build" "${_snapshot}"

    meson compile -C "build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "build"
}
