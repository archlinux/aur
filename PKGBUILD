# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on protonvpn-cli-ng: Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng-git
pkgver=2.2.3.r2.gdd0aab7
pkgrel=1
pkgdesc="A Linux CLI for ProtonVPN."
arch=("any")
url="https://github.com/ProtonVPN/linux-cli"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests" "python-jinja")
makedepends=("git")
replaces=("protonvpn-cli")
_product=protonvpn-cli-ng
conflicts=("${_product}")
provides=("${_product}")
_src_name=linux-cli
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "${_src_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_src_name}"
  python setup.py install --optimize=1 --root="$pkgdir" 
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}