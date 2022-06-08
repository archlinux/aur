# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on protonvpn-cli-ng by Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-community-git
_oldpkgname=protonvpn-cli-ng-git
pkgver=2.2.10.r3.g3614101
pkgrel=1
pkgdesc="A Community Linux CLI for ProtonVPN"
arch=("any")
url="https://github.com/ProtonVPN/linux-cli-community"
license=("GPL3")
depends=("openvpn" "dialog" "python-pythondialog" "python-setuptools"
		 "python-docopt" "python-requests" "python-jinja" "python-distro")
makedepends=("git")
provides=("${pkgname%-git}=${pkgver}" "${_oldpkgname}")
conflicts=("protonvpn-cli" "protonvpn-gui" "${pkgname%-git}" "${_oldpkgname}")
replaces=("${_oldpkgname}")
source=("git+${url}")
sha256sums=('SKIP')
_src_name=linux-cli-community

pkgver() {
	cd "${_src_name}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_src_name}"
	python setup.py install --optimize=1 --root="${pkgdir}"
}
