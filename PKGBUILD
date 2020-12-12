# Contributor: Jamie Beardslee
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-application-framework-git
pkgver=r1587.9e1b531
pkgrel=1
pkgdesc="EAF extends GNU Emacs to an entire universe of powerful GUI applications."
arch=('any')
url="https://github.com/manateelazycat/emacs-application-framework"
license=('GPL3')
depends=('emacs' 'python-dbus' 'python-pyqt5' 'python-pyqtwebengine' 'wmctrl')
optdepends=('python-pymupdf: for pdf viewer'
	    'python-grip: for markdown preview'
	    'python-qrcode: for qr codes'
	    'python-feedparser: for rss reader'
	    'python-pyinotify: for mermaid'
	    'python-markdown: for mermaid'
	    'nodejs: for mermaid'
	    'aria2: for browser'
	    'libreoffice: doc viewer'
	    'filebrowser: for file browser')
makedepends=('git')
provides=('emacs-eaf')
conflicts=('emacs-eaf')
source=("git+https://github.com/manateelazycat/emacs-application-framework")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/eaf/
  for _i in app core docker *.el *.py
  do
    cp -r ${_i} "$pkgdir"/usr/share/emacs/site-lisp/eaf/
  done
  install -Dm644 README.md "$pkgdir"/usr/share/doc/emacs-eaf/README.md
  # no binaries under /usr/share
  rm "$pkgdir"/usr/share/emacs/site-lisp/eaf/app/terminal/node_modules/node-pty/build/Release/pty.node
  rmdir "$pkgdir"/usr/share/emacs/site-lisp/eaf/app/terminal/node_modules/node-pty/build/Release
  rm "$pkgdir"/usr/share/emacs/site-lisp/eaf/app/terminal/node_modules/node-pty/node_modules/nan
  rmdir "$pkgdir"/usr/share/emacs/site-lisp/eaf/app/terminal/node_modules/node-pty/node_modules/
}
