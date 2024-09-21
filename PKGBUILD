# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="rosecrypt"
pkgname="${_pkgname}-bin"
pkgver=1.2
pkgrel=1
pkgdesc="A simplistic application for encrypting files using a custom passphrase"
arch=('x86_64' 'i686')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
makedepends=('patchelf')
depends=('gdk-pixbuf2' 'gtk2' 'glib2' 'glibc' 'libx11' 'pango')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.txt::https://downloads.sourceforge.net/sourceforge/${_pkgname}/README.txt"
        "FAQ-${pkgver}.txt::https://downloads.sourceforge.net/sourceforge/${_pkgname}/FAQ.txt"
        "CHANGELOG-${pkgver}.txt::https://downloads.sourceforge.net/sourceforge/${_pkgname}/ChangeLog.txt")
source_x86_64=("${_pkgsrc}-x86_64::https://downloads.sourceforge.net/sourceforge/${_pkgname}/rosecrypt64bit")
source_i686=("${_pkgsrc}-i686::https://downloads.sourceforge.net/sourceforge/${_pkgname}/RoseCrypt32bit")
b2sums=('fbc309aec54827fb8900c6c2083e7822657d72f524f122fec348735e5cf2c4b9812dd68524492d09820f8cb3e677a43e647d51beb0d037caf8527da9385b8e8c'
        '73ed9531dd179f37e311343a2846f27481669f014b74d26b2ac11abc21f4661a1346702cb0b9cd3af17470ddabfa205ba6640b8dcc53a870b678c15e003f4728'
        '8f4a6a0aa2773f7478229791be25fbddf7493418a3c0f287d427368f6fe7bbc2a4ac0b73b2e92504afbfdbb549eadf451a59259b8e4d366770e6c7e83ace29c9')
b2sums_x86_64=('96c038fa74e1079e2a561209b9ccf2d3c4e33aca3f9b4e407d9bd04ae1549966780e93fe4414a7852dcaa480ac6d9c3e386e6a78f305fa0ecdd9411c560e3206')
b2sums_i686=('b290046916412b65554de535e999ec7364091dda311562680ea396d00b00d66e9d250f420875594b9ebebacf2155fd6522b1579642dd65f19ae72c0f17853bd2')

prepare() {
  cd "${srcdir}"
  patchelf --remove-needed "libgmodule-2.0.so.0" "${_pkgsrc}-${CARCH}"
  patchelf --remove-needed "libcairo.so.2"       "${_pkgsrc}-${CARCH}"
  patchelf --remove-needed "libatk-1.0.so.0"     "${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"     "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.txt"    "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -Dm644 "FAQ-${pkgver}.txt"       "${pkgdir}/usr/share/doc/${_pkgname}/FAQ.txt"
  install -Dm644 "CHANGELOG-${pkgver}.txt" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.txt"
}
