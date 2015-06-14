# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-gettext-tools
pkgver=0.0.1.20141216200739
_srcdirname=deepin-gettext-tools-0.0.1+20141216200739~6ba50ecb9c
pkgrel=1
pkgdesc='Deepin Internationalization utilities'
arch=('any')
url="https://gitcafe.com/Deepin/deepin-gettext-tools"
license=('GPL3')
groups=('deepin-dev')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-gettext-tools/deepin-gettext-tools_0.0.1+20141216200739~6ba50ecb9c.tar.gz")
sha256sums=('3ab3dab041ac8902e6ca50c1282fea2deec794cdd208972dbc56f4f5eaba539b')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='

  # simple patch
  sed -e '61s/sudo cp/cp/' -e '85s/sudo cp/cp/' -i src/generate_mo.py || die "sed failed"
}

package() {
  depends=('gettext' 'python2')

  cd "${_srcdirname}"

  install -dm755 "${pkgdir}"/usr/{bin,lib/deepin-gettext-tools}
  install -m755 src/generate_mo.py "${pkgdir}"/usr/lib/deepin-gettext-tools/
  install -m755 src/update_pot.py "${pkgdir}"/usr/lib/deepin-gettext-tools/
  install -m644 src/blank.py "${pkgdir}"/usr/lib/deepin-gettext-tools/
  ln -s /usr/lib/deepin-gettext-tools/generate_mo.py "${pkgdir}"/usr/bin/deepin-generate-mo
  ln -s /usr/lib/deepin-gettext-tools/update_pot.py "${pkgdir}"/usr/bin/deepin-update-pot
}
