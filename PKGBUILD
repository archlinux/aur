_pkgname=scannerl
pkgname="${_pkgname}-git"
pkgver=0.38.r0.gc5b1b15
pkgrel=2
pkgdesc="The modular distributed fingerprinting engine"
arch=('any')
url="https://github.com/kudelskisecurity/scannerl"
license=('GPL')
groups=()
depends=('erlang-nox>=20' 'openssh')
makedepends=('rebar' 'git')
provides=(scannerl)
conflicts=(scannerl)
source=("git+https://github.com/kudelskisecurity/scannerl.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./build.sh
}

package() {
  cd "${_pkgname}"

  install -Dm755 scannerl "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -Dm644 DISCLAIMER.txt "${pkgdir}/usr/share/doc/${_pkgname}/DISCLAIMER.txt"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

