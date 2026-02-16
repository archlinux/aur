# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Steve trackmastersteve@gmail.com
# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.4.3
pkgrel=4
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
depends=('python' 'python-pkg_resources' 'python-pyusb')
optdepends=(
'gtk3: gtkui'
'python-cairo: gtkui'
# https://github.com/trackmastersteve/alienfx/issues/143
'python-future: gtkui'
'python-gobject: gtkui'
)
makedepends=('python-setuptools')
source=("https://github.com/trackmastersteve/alienfx/archive/v$pkgver.tar.gz")
sha256sums=('44cda16a00f8396043173fd939693a3a593811cf67c350b7035293b7d635c339')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
