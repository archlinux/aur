# Maintainer: diplomat
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on protonvpn-cli-ng by Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-community
_oldpkgname=protonvpn-cli-ng
pkgver=2.2.12
pkgrel=2
pkgdesc="A Community Linux CLI for ProtonVPN"
arch=('any')
url="https://github.com/Rafficer/linux-cli-community"
license=('GPL3')
depends=('openvpn' 'dialog' 'python-docopt' 'python-requests' 'python-jinja' 'python-distro')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-py-dialog')
provides=("${_oldpkgname}")
conflicts=('protonvpn-cli' 'protonvpn-gui' "${_oldpkgname}")
replaces=("${_oldpkgname}")
source=("linux-cli-community-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('586b34fb87ad0823fc24643c7b460acef517da4257b1330c9064009ec1215168')

prepare() {
    if ! pacman -Qi python-py-dialog &>/dev/null; then
        echo "AUR dependency python-py-dialog not found."
        echo "Install it first using: yay -S python-py-dialog"
        exit 1
    fi
}

build() {
    cd "linux-cli-community-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "linux-cli-community-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
