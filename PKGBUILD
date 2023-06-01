# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}
pkgver=0.10.1
_pkgversub=-beta
pkgrel=1
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/dfshow"
license=('GPL3')
depends=('ncurses' 'libconfig')
makedepends=('autoconf' 'automake' 'libconfig' 'acl' 'gettext')
source=(https://github.com/roberthawdon/dfshow/archive/v${pkgver}${_pkgversub}.tar.gz)
sha1sums=('72e489b33b3d236dfd3d6428f0f8a131aba11514')
options=('!buildflags' '!makeflags')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 misc/auto-completion/bash/show-completion.bash "${pkgdir}/usr/share/bash-completion/completions/show"
  install -Dm644 misc/auto-completion/bash/sf-completion.bash "${pkgdir}/usr/share/bash-completion/completions/sf"
  install -Dm644 misc/auto-completion/zsh/_show "${pkgdir}/usr/share/zsh/site-functions/_show"
  install -Dm644 misc/auto-completion/zsh/_sf "${pkgdir}/usr/share/zsh/site-functions/_sf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
