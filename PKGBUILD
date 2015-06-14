# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=python2-deepin-ui
pkgver=1.1.20141229194712
_srcdirname=deepin-ui-1.1+20141229194712~5a86faec50
pkgrel=1
pkgdesc='UI toolkit for Linux Deepin'
arch=('i686' 'x86_64')
url="https://gitcafe.com/Deepin/deepin-ui"
license=('GPL3')
groups=('deepin')
depends=('python2-deepin-utils' 'python2-deepin-gsettings' 'deepin-pygtk'
         'python2-scipy' 'glib2' 'python2-cairo' 'python2-imaging'
         'python2-xlib' 'pywebkitgtk' 'libsoup')
makedepends=('deepin-gettext-tools' 'python2-setuptools' 'webkitgtk')
provides=('deepin-ui')
replaces=('deepin-ui' 'deepin-ui-git')
conflicts=('deepin-ui' 'deepin-ui-git')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-ui/deepin-ui_1.1+20141229194712~5a86faec50.tar.gz")
sha256sums=('3829f85b4b888d36fac9f9d9180e6d2453e3f3fcdcc02f1051503d4ba100decc')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build(){
  cd "${_srcdirname}"

  python2 setup.py build
  deepin-generate-mo dtk/tools/locale_config.ini
}

package() {
  cd "${_srcdirname}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -dm 755 "${pkgdir}"/usr/share/locale
  cp -r dtk/locale/mo/* "${pkgdir}"/usr/share/locale/
}
