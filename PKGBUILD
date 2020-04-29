# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng-git
product=protonvpn-cli-ng
pkgver=2.2.2.r0.ga5f1c61
pkgrel=1
pkgdesc="ProtonVPN CLI tool for protonvpn.com"
arch=("any")
url="https://github.com/ProtonVPN/linux-cli"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests")
replaces=("protonvpn-cli")
conflicts=("${product}")
provides=("${product}")
_src_name=linux-cli
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${_src_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_src_name}"

    python setup.py install --optimize=1 --root="${pkgdir}"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
