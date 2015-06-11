# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=emacs-twittering-mode-git
pkgver=v3.0.0.29.gb04a3af
pkgrel=1
pkgdesc="An Emacs major mode for Twitter (git version)"
arch=('any')
url="http://twmode.sourceforge.net/index.html"
license=('GPL')
depends=('emacs>=23.1' 'curl')
makedepends=('git')
optdepends=('gnupg: For keeping an OAuth authorized token in a local storage encrypted with master password')
install=emacs-twittering-mode-git.install
conflicts=('emacs-twittering-mode')
provides=('emacs-twittering-mode')
source=('twittering-mode::git+https://github.com/hayamiz/twittering-mode.git')
md5sums=('SKIP')

_gitname='twittering-mode'

pkgver() {
  cd "$srcdir/$_gitname"
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  emacs -q -batch -f batch-byte-compile twittering-mode.el
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 twittering-mode.el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 twittering-mode.elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/emacs-twittering-mode-git
  install -c -m 644 README.markdown "$pkgdir"/usr/share/doc/emacs-twittering-mode-git
  install -c -m 644 README.ja "$pkgdir"/usr/share/doc/emacs-twittering-mode-git
}

# vim:set ts=2 sw=2 et:
