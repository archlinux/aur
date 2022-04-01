# Maintainer: Sick Codes <info@sick.codes>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages
# Contributor: Paolo Stivanin aka Polslinux <admin AT polslinux DOT it>
# pkgrel3 patcher: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=cryptkeeper
pkgver=0.9.5
pkgrel=6
pkgdesc="Cryptkeeper is a FreeDesktop.org (KDE, Gnome, XFce, etc.) system tray applet that manages EncFS encrypted folders"
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/tomm/cryptkeeper/"
license=('GPL3')
depends=('gtk2' 'gconf' 'encfs')
makedepends=('autoconf')

source=("git+https://github.com/tomm/${pkgname}.git#commit=de57c19e14ddd86eaaa2a6baa45b692180940b2f"
        "cryptkeeper-0.9.5-fix-linking.patch"
        "cryptkeeper-0.9.5-add-unistd-to-lsof.patch")
md5sums=('SKIP'
         'aa864cea6a81ef8e8cb3efa5ef2b9541'
         '2e21a1e82942213108774d768e12e4ee')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 < "${srcdir}"/cryptkeeper-0.9.5-fix-linking.patch
  patch -Np1 < "${srcdir}"/cryptkeeper-0.9.5-add-unistd-to-lsof.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
