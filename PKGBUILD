# Maintainer: Philipp Koppenstein philipp@koppenstein.com

_pkgname='mangl'
pkgname="${_pkgname}-git"
pkgver=1.0.3.r0.g4123b26
pkgrel=1
pkgdesc="graphical man page viewer"
arch=('x86_64')
url="https://github.com/zigalenarcic/mangl"
license=('BSD 2-Clause')
depends=('zlib' 'freeglut' 'libgl' 'glu')
makedepends=('git')
optdepends=('fontconfig: set custom font')
source=("${_pkgname}::git+https://github.com/zigalenarcic/mangl.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP' 
            '370e454df24a2bf0bf185988d92083c0ec5bd72548a5fba9c44867e76a1d8d91')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_pkgname}/mandoc"
  ./configure --prefix=/usr --exec_prefix=/usr
  make -C ..
}

package() {
  install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  cd "$srcdir/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
