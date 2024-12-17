# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="pymoldyn"
pkgver="0.10.0"
pkgrel="0"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=(
    "pyside6"
    "python-dateutil"
    "python-gr-framework"
    "python-h5py"
    "python-jinja"
    "python-numpy"
    "python-opengl"
)
makedepends=(
    "python-build"
    "python-gr-framework"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("https://github.com/sciapp/pyMolDyn/archive/v${pkgver}.tar.gz")
sha256sums=("da8fef9c15c9cb762ffb21af989350901b7514673c7f87b6378bfea4a8a15180")

build() {
    cd "${srcdir}/pyMolDyn-v${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/pyMolDyn-v${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl && \
    mkdir -p \
        usr/share/applications \
        usr/share/pixmaps && \
    cp -v "${srcdir}/pyMolDyn-v${pkgver}/src/icon.png" "usr/share/pixmaps/pymoldyn.png" && \
    cat <<-EOF > "usr/share/applications/pyMolDyn.desktop" || return
		[Desktop Entry]
		Categories=Science;
		Comment=A molecule viewer with cavity computation
		Exec=pymoldyn
		GenericName=pyMolDyn
		Icon=pymoldyn
		Name=PyMolDyn
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
}
