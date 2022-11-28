# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <phpwutz@gmail.com>
pkgname=k8sfw-daemon
pkgrel=1
pkgdesc="Daemon to manage kubernetes port-forwards"
pkgver=v0.0.1.r5.g2f49808
arch=('x86_64')
url=""
license=('MIT')
groups=()
depends=('jq' 'nlohmann-json' 'kubectl' 'bash')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("k8sfw-daemon::git+ssh://git@gitlab.xn--kll-sna.net:10022/k8sfw/k8sfw-daemon.git#branch=main")
noextract=()
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cmake -B build -S "${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    cmake --build build
    # make kubeproxy-daemon
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
