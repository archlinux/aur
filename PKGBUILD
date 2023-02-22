_name=gegl
pkgname=${_name}-light
pkgver=0.4.42
pkgrel=1
pkgdesc='Graph based image processing framework (stripped to bare minimum for GIMP to run)'
arch=('x86_64')
url='https://www.gegl.org/'
license=('GPL3' 'LGPL3')
provides=("${_name}")
conflicts=("${_name}")
depends=('babl' 'json-glib' 'exiv2' 'libpng' 'libjpeg' 'cairo')
makedepends=('meson' 'intltool' 'gobject-introspection')

_tag="GEGL_${pkgver//./_}"
_snapshot="${_name}-${_tag}"
source=("https://gitlab.gnome.org/GNOME/${_name}/-/archive/${_tag}/${_snapshot}.tar.gz")
sha256sums=('cd1e77207885348ebe25f442174f95759a97ad5e291195f941ea910d76dd1deb')

_buildflags=(
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

build() {
    arch-meson "${_buildflags[@]}" \
        "build" "${_snapshot}"

    meson compile -C "build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "build"
}
