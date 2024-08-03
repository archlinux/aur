# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=ponymix-git
_pkgname=ponymix
pkgver=5.r6.g242e97f
pkgrel=1
pkgdesc="CLI PulseAudio Volume Control"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/ponymix"
license=('MIT')
depends=('pulse-native-provider' 'libnotify')
makedepends=('git')
conflicts=('ponymix')
provides=('ponymix')
source=("${_pkgname}::git+https://github.com/falconindy/ponymix.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh syn=sh et
