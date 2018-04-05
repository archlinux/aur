# Maintainer: David Runge <dave@sleepmap.de>
pkgbase=non-daw
pkgname=('non-mixer' 'non-session-manager' 'non-timeline')
pkgver=1.2.0
pkgrel=2
pkgdesc=""
arch=('x86_64')
url="https://non.tuxfamily.org/"
license=('GPL3')
groups=('non-daw' 'pro-audio')
makedepends=('jack' 'ladspa' 'liblo' 'liblrdf' 'libxpm' 'ntk' 'python')
source=("$pkgbase-$pkgver.tar.gz::https://git.tuxfamily.org/non/non.git/snapshot/${pkgbase}-v${pkgver}.tar.gz")
sha512sums=('0f6f93032a546ea85af5554249e8a88bce0808bf6c852ba922d9f570f82d09052d1242dd579d427b59234c3991b8d8d665d3920ffff3170dc7f8d30556bde005')

prepare() {
  mv -v "${pkgbase}-v${pkgver}" "${pkgbase}-${pkgver}"
  cp -av "${pkgbase}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgbase}-${pkgver}" "${pkgname[1]}-${pkgver}"
  cp -av "${pkgbase}-${pkgver}" "${pkgname[2]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  ./waf configure --prefix=/usr --project=mixer
  ./waf
  cd ../"${pkgname[1]}-${pkgver}"
  ./waf configure --prefix=/usr --project=session-manager
  ./waf
  cd ../"${pkgname[2]}-${pkgver}"
  ./waf configure --prefix=/usr --project=timeline
  ./waf
}

package_non-mixer() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Mixer"
  depends=('hicolor-icon-theme' 'jack' 'liblo' 'liblrdf' 'ntk')
  cd "$pkgname-$pkgver"
  ./waf --destdir="${pkgdir}" install
}

package_non-session-manager() {
  pkgdesc="An API and an implementation for session management in the context of Linux Audio"
  depends=('hicolor-icon-theme' 'jack' 'liblo' 'ntk')
  cd "$pkgname-$pkgver"
  ./waf --destdir="${pkgdir}" install
}

package_non-timeline() {
  pkgdesc="A powerful, reliable and fast modular Digital Audio Timeline arranger"
  depends=('hicolor-icon-theme' 'jack' 'liblo' 'ntk')
  optdepends=('python2: For import-ardour-session')
  cd "$pkgname-$pkgver"
  ./waf --destdir="${pkgdir}" install
}
