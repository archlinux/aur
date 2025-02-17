# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="radiotray-ng-mpris"
pkgver="0.1.3"
pkgrel="2"
pkgdesc="A wrapper script for Radiotray-NG which provides an MPRIS2 interface."
arch=("any")
url="https://github.com/IngoMeyer441/radiotray-ng-mpris"
license=("MIT")
depends=(
    "python"
    "python-mpris_server"
    "python-pydbus"
    "python-yacl"
    "radiotray-ng"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("https://github.com/IngoMeyer441/radiotray-ng-mpris/archive/v${pkgver}.tar.gz")
sha256sums=("ca42fc5e6079ebd408af61504c5d0ea27cab16d6885a428180c4f2dcf8e0e70c")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl && \
    cd "${pkgdir}" && \
    mkdir -p usr/share/applications && \
    cat <<-EOF > "usr/share/applications/radiotray-ng-mpris.desktop" || return
		[Desktop Entry]
		Categories=AudioVideo;Audio;Player;GTK;
		Comment=A wrapper script for Radiotray-NG which provides an MPRIS2 interface.
		Exec=/usr/bin/radiotray-ng-mpris
		GenericName=Radiotray-NG MPRIS
		Icon=/usr/share/icons/hicolor/256x256/apps/radiotray-ng-notification.png
		Name=Radiotray-NG MPRIS
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
}
