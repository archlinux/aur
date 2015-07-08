# Maintainer: Jerome M. Berger <jeberger@free.fr>
pkgname=ensime-git
pkgver=r1661.1ec611b
pkgrel=1
pkgdesc="The ENhanced Scala Interaction Mode for Emacs"
arch=('any')
url="https://github.com/ensime/ensime-server"
license=('BSD')
depends=('auto-complete' 'emacs' 'emacs-dash' 'emacs-popup-el' 'emacs-s' 'emacs-yasnippet' 'sbt')
makedepends=('git')
provides=('ensime')
conflicts=('ensime')
install=
source=('git+https://github.com/ensime/ensime-emacs.git')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/ensime-emacs"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/ensime-emacs"
  install -m755 -d "${pkgdir}/usr/share/emacs/site-lisp/ensime"
  install -m644 *.el "${pkgdir}/usr/share/emacs/site-lisp/ensime/"
}

# vim:set ts=2 sw=2 et:
