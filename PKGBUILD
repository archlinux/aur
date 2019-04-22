# Maintainer: la Fleur <lafleur chez boum.org>
# Contributor: la Fleur <lafleur chez boum.org>

# This is the git PKGBUILD for servicewall

_pkgname=servicewall
pkgname=servicewall-git
pkgdesc="The firewall that remembers the different networks you connect to."
pkgver=0.4.2.r10.716bb3d
pkgrel=1
arch=("any")
url="https://github.com/lafleurdeboum/servicewall"
#url="https://pypi.python.org/pypi/servicewall"
license=("GPL3")
depends=("python" "python-iptables" "python-argparse" "python-netifaces" "python-systemd" "ulogd")
optdepends=("python-argcomplete" "networkd-dispatcher" "networkmanager")
makedepends=("python-distribute" "python-setuptools" "git")
install=servicewall.install
backup=("etc/servicewall/realms.json" "etc/servicewall/config.json")

# Sources for git repos :
#source=("${pkgname%-git}::git://localhost/#branch=systray")
source=("${pkgname%-git}::git://localhost/#branch=master")

# Sources for non-git repos :
#options=(!emptydirs)
#source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")

md5sums=("SKIP")


pkgver() {
  #cd "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname%-git}"
  # git, no tags available
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # Git, tags available
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
