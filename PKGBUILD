# Maintainer: hashhar <hashhar_dev AT outlook DOT com>
# Contributor: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname="arc-firefox-theme"
pkgname="${_pkgname}-git"
pkgver=20170311.25b18b8
pkgrel=2
pkgdesc="Arc Firefox Theme"
url="https://github.com/horst3180/arc-firefox-theme"
arch=('any')
license=('custom:MPL2.0')
depends=('firefox')
optdepends=('arc-gtk-theme: Uniform theme look.')
makedepends=('autoconf' 'automake' 'zip' 'unzip' 'git')
source=("${_pkgname}::git+https://github.com/horst3180/arc-firefox-theme.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}"/"${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/"${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
