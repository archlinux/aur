# Maintainer: Abdulhaq Emhemmed <el.ingeniero09@gmail.com>
pkgname=green-recorder
pkgver=2.0
pkgrel=2
pkgdesc="A simple yet functional desktop recorder for Linux systems."
arch=('any')
url="https://github.com/green-project/green-recorder"
license=('GPL')
depends=('python2-pydbus'
         'libappindicator-gtk3'
         'gawk'
         'python2-gobject'
         'python2-urllib3'
         'xorg-utils'
         'ffmpeg')
optdepends=('gnome-shell: Gnome on Wayland desktop recording.')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/green-project/${pkgname}/archive/${pkgver}.tar.gz"
        "non_gnome_session_fix.patch::https://github.com/green-project/${pkgname}/commit/98575fa29706dac502746eee4c38b4b065ad2c2a.patch")
sha256sums=('5d4921b784f5fe1ffdf0ef9ddc54cdddccf1f757e84b720949301cc4f4b884df'
            'da69dbc47fa6068fafe6c2a6b30ff1c47e118b0233dc036ce3a48062ac13acd5')
 
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../non_gnome_session_fix.patch
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
 
  # desktop file is 755 for some reason
  chmod 644 data/${pkgname}.desktop
 
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
