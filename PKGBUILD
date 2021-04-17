# Contributor: Jamie Beardslee
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>, Mingde (Matthew) Zeng <matthewzmd@posteo.net>

pkgname=emacs-application-framework-git
pkgver=r1908.b21efed
pkgrel=1
pkgdesc="EAF extends GNU Emacs to an entire universe of powerful GUI applications."
arch=('any')
url="https://github.com/manateelazycat/emacs-application-framework"
license=('GPL3')
depends=('emacs' 'python-epc' 'python-pyqt5' 'python-pyqt5-sip' 'python-pyqtwebengine' 'wmctrl' 'nodejs')
optdepends=('python-pymupdf: EAF PDF Viewer support'
	        'python-qrcode: EAF File Sender/File Receiver/Airshare support'
	        'libreoffice: EAF Doc Viewer support'
	        'filebrowser-bin: EAF File Browser support'
            'python-qtconsole: EAF Jupyter support'
            'python-retrying: EAF Markdown Previewer support')
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
}
