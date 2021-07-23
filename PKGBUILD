# Contributor: Jamie Beardslee
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>, Mingde (Matthew) Zeng <matthewzmd@posteo.net>

pkgname=emacs-application-framework-git
pkgver=r2086.4b5d4294
pkgrel=1
pkgdesc="EAF extends GNU Emacs to an entire universe of powerful GUI applications."
arch=('any')
url="https://github.com/manateelazycat/emacs-application-framework"
license=('GPL3')
makedepends=('git' 'nodejs' 'npm')
depends=('python-pyqt5' 'python-pyqt5-sip' 'python-pyqtwebengine' 'wmctrl'
         'python-qrcode' 'aria2' 'python-qtconsole' 'taglib'
         'filebrowser-bin')
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
  for _i in LICENSE app core docker *.el *.py *.js *.sh package.json
  do
    cp -r ${_i} "$pkgdir"/usr/share/emacs/site-lisp/eaf/
  done
  install -Dm644 README.md "$pkgdir"/usr/share/doc/emacs-application-framework-git/README.md
  install -Dm644 README.zh-CN.md "$pkgdir"/usr/share/doc/emacs-application-framework-git/README.zh-CN.md

  cd "$pkgdir"/usr/share/emacs/site-lisp/eaf && ./install-eaf.sh --ignore-sys-deps

  echo "Installation complete, please add $pkgdir/usr/share/emacs/site-lisp/eaf/ to your load-path."
}
