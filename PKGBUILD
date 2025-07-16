# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=opengamepadui-git
_pkgbase=OpenGamepadUI
pkgver=0.40.4.r0.ga74221c4
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
  'libxdmcp' 'gamescope' 'vulkan-tools' 'mesa-utils' 'inputplumber'
)
optdepends=('firejail' 'bubblewrap' 'wireplumber' 'networkmanager' 'bluez' 'dbus' 'powerstation')
makedepends=('godot' 'rust' 'pkgconf' 'make' 'unzip' 'wget' 'git')
provides=('opengamepadui')
conflicts=('opengamepadui-bin')
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
  cd "$srcdir/${_pkgbase}"
  make build
}

package() {
  options=('!strip')
  cd "$srcdir/${_pkgbase}"

  make install PREFIX="${pkgdir}/usr"
}
