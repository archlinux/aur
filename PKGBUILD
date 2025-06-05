# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms-git
_pkgname=${pkgname%-git}
_reponame=${_pkgname%-dkms}
pkgver=0.4.5.r6.g7f8f8e6
pkgrel=1
epoch=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS) - git version"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("ddcci-driver-linux" "ddcci-driver-linux-dkms")
source=("git+https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux.git")
b2sums=('SKIP')

pkgver() {
  cd "$_reponame"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

package() {
  cd "$_reponame"
  local lastver=$(git describe --tags --abbrev=0)
  local vernum=${lastver#v}
  local destdir="${pkgdir}/usr/src/ddcci-${vernum}"
  cd ..

  install -d "${destdir}"
  cp -rT "$_reponame" "${destdir}"
}
