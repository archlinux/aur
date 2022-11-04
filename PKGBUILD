# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="radiotray-ng-mpris"
pkgver="0.1.1"
pkgrel="1"
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
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/radiotray-ng-mpris/archive/v${pkgver}.tar.gz")
sha256sums=("1c0cbc3537142cfa5ca8d3b965b048b3f10cc42bff91ffb8364ffc3843d03997")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build && \
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
