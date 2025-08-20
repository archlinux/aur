# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}-rc
_pkgver=1.0.0
_pkgversub=-rc4
pkgver=${_pkgver}${_pkgversub/-/}
pkgrel=1
pkgdesc="An interactive directory/file browser written for Unix-like systems. Release Candidate"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/${_pkgname}"
license=('GPL3')
depends=('ncurses' 'libconfig')
makedepends=('libconfig' 'acl' 'gettext')
source=(https://github.com/roberthawdon/${_pkgname}/releases/download/v${_pkgver}${_pkgversub}/${_pkgname}-v${_pkgver}${_pkgversub}.tar.gz)
sha256sums=('9989d1828d56cc253d1e35ca178ac94cd9e26e413bd00eee44da226faeb50d22')
conflicts=('dfshow' 'dfshow-git')
options=('!buildflags' '!makeflags')

build() {
  cd "${srcdir}/${_pkgname}-v${_pkgver}${_pkgversub}"
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share
  make
}

package() {
  cd "${srcdir}/${_pkgname}-v${_pkgver}${_pkgversub}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 misc/auto-completion/bash/show-completion.bash "${pkgdir}/usr/share/bash-completion/completions/show"
  install -Dm644 misc/auto-completion/bash/sf-completion.bash "${pkgdir}/usr/share/bash-completion/completions/sf"
  install -Dm644 misc/auto-completion/zsh/_show "${pkgdir}/usr/share/zsh/site-functions/_show"
  install -Dm644 misc/auto-completion/zsh/_sf "${pkgdir}/usr/share/zsh/site-functions/_sf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
