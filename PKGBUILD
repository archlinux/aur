# Maintainer: JaydenDev <jdev0894@gmail.com>
# Contributor: Davor Balder <dbalder@ozemail.com.au>
# Contributor: Jiyunatori <tori_LEAVETHISOUT_@0xc29.net>
# Contributor: mdev
# Previous Maintainer: gryffyn <aur@evan.mp>

pkgname=emacs-org-mode
_srcname=org-mode-release
pkgver=9.6.6
pkgrel=2
pkgdesc="Emacs Org Mode"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
optdepends=('java-runtime: For using ditaa.jar in the contrib directory'
	    'zsh: for using dir2org.zsh in the contrib directory')
license=('GPL')
install=emacs-org-mode.install
source=("https://git.savannah.gnu.org/cgit/emacs/org-mode.git/snapshot/${_srcname}_${pkgver}.tar.gz")
sha256sums=('788aa5c07ae6f4952f3455093dea34903f5ed7a49c86f41dae192c80be477216')

build() {
  cd "${_srcname}_${pkgver}"
  make autoloads
}

package() {
  cd "${_srcname}_${pkgver}"
  make DESTDIR="$pkgdir" install

  ls

  ##! proper install of info files (thanks mdev)
  ##! replace "orgmode" with "org" in the following lines if you want
  ##! to replace emacs own org's info files. You also need to change the  .install.
  install -D -m644 doc/org.info "$pkgdir"/usr/share/info/orgmode.info
  gzip -9 "$pkgdir"/usr/share/info/orgmode.info
  rm "$pkgdir"/usr/share/info/org.info
}
