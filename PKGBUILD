
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Luis Braun <luis.braun07@gmail.com>
pkgname=qtile-config-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="a qtile config"
arch=(x86_64)
url="https://github.com/luis-07/qtile-config"
license=('GPL')
groups=()
depends=()
makedepends=(qtile-git gksu xmenu picom-jonaburg-git tint2 rofi)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()



pkgver() {
	cd "${_pkgname}"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd qtile-config/core
	python3 qtile-config-installer.py
}

package() {
    cd qtile-config
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
