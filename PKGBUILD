# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}
_pkgver=1.0.0
pkgver=${_pkgver}
pkgrel=3
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/${_pkgname}"
license=('GPL3')
depends=('ncurses' 'libconfig')
makedepends=('libconfig' 'acl' 'gettext')
source=(https://github.com/roberthawdon/${_pkgname}/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}.tar.gz)
sha256sums=('b37e96f93c9b1e3b067fa25228e3dfe5a01018627d94edb337d45f6b6a2091d9')
conflicts=('dfshow' 'dfshow-git')
options=('!buildflags' '!makeflags')

build() {
  cd "${srcdir}/${_pkgname}-v${_pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share
  make
}

package() {
  cd "${srcdir}/${_pkgname}-v${_pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 misc/auto-completion/bash/show-completion.bash "${pkgdir}/usr/share/bash-completion/completions/show"
  install -Dm644 misc/auto-completion/bash/sf-completion.bash "${pkgdir}/usr/share/bash-completion/completions/sf"
  install -Dm644 misc/auto-completion/zsh/_show "${pkgdir}/usr/share/zsh/site-functions/_show"
  install -Dm644 misc/auto-completion/zsh/_sf "${pkgdir}/usr/share/zsh/site-functions/_sf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
