# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=kluppe
pkgver=0.6.16
pkgrel=1
pkgdesc="A loop-player and recorder, designed for live use."
arch=('i686' 'x86_64')
url="http://kluppe.klingt.org/"
license=('GPL')
depends=('gtk2' 'jack' 'liblo' 'libusb-compat' 'libsndfile' 'libxml2')
provides=('kluppe')
install="$pkgname.install"
source=("http://kluppe.klingt.org/downloads/$pkgname-$pkgver.tar.gz"
        "kluppe-${pkgver}.patch"
        "kluppe.desktop")
sha256sums=('641e222759579256ed176274f1657570688e50ee1b66b73e548329927548f403'
            '79d0de9ece722c6ffce501a6593bd7fca22b8a940dd3b2801b76a396e3b75b0e'
            'faf8d61fa6730d9946aa2f3dbab1c78e20681a951f9184ef9ad76f2086ca3d4c')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${source[1]}"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
